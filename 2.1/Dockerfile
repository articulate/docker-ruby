FROM ruby:2.1

RUN apt-get update -qq \
  && apt-get -y install build-essential libpq-dev git wget \
  libyaml-dev postgresql-client-9.4 nodejs npm \
  && rm -rf /var/lib/apt/lists/*

COPY imagemagick-policy.xml /etc/ImageMagick-6/policy.xml

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
RUN bash /tmp/consul_template_install.sh && rm /tmp/consul_template_install.sh

ENTRYPOINT ["/entrypoint.sh"]
