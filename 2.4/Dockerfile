FROM ruby:2.4

RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -

RUN apt-get update -qq \
  && apt-get -y install build-essential libpq-dev libqt4-dev git wget \
  libyaml-dev postgresql-client-9.4 xvfb nodejs \
  && rm -rf /var/lib/apt/lists/*

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
RUN bash /tmp/consul_template_install.sh && rm /tmp/consul_template_install.sh

RUN useradd --home /service -ms /bin/bash service
WORKDIR /service

ENTRYPOINT ["/entrypoint.sh"]
