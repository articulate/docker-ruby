FROM ruby:2.4

ENV SERVICE_ROOT /service
ENV SERVICE_USER service

RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -

RUN apt-get update -qq \
  && apt-get -y install build-essential libpq-dev libqt4-dev git wget \
  libyaml-dev postgresql-client-9.4 xvfb nodejs \
  && rm -rf /var/lib/apt/lists/*

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
RUN bash /tmp/consul_template_install.sh && rm /tmp/consul_template_install.sh

RUN groupadd $SERVICE_USER && useradd --create-home --home $SERVICE_ROOT --gid $SERVICE_USER --shell /bin/bash $SERVICE_USER
WORKDIR $SERVICE_ROOT

ENTRYPOINT ["/entrypoint.sh"]
