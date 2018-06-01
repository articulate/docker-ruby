FROM ruby:2.4-stretch

ENV SERVICE_ROOT /service
ENV SERVICE_USER service

RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -

RUN apt-get update -qq \
  && apt-get -y install make build-essential libpq-dev git wget \
  qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x \
  libyaml-dev postgresql-client-9.6 xvfb nodejs \
  && apt-get upgrade -y \
  && rm -rf /var/lib/apt/lists/*

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
RUN bash /tmp/consul_template_install.sh && rm /tmp/consul_template_install.sh

RUN groupadd $SERVICE_USER && useradd --create-home --home $SERVICE_ROOT --gid $SERVICE_USER --shell /bin/bash $SERVICE_USER
WORKDIR $SERVICE_ROOT

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/wait-for-it.sh /wait-for-it.sh
RUN chmod a+rx /wait-for-it.sh

ENTRYPOINT ["/entrypoint.sh"]
