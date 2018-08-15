FROM alpine:3.8

ENV SERVICE_ROOT /service
ENV SERVICE_USER service
ENV NPM_VER=6.1.0

ENV NOKOGIRI_USE_SYSTEM_LIBRARIES=1

RUN apk add --no-cache make libpq qt git curl wget yaml postgresql-client xvfb bash nodejs binutils jq sudo unzip libffi-dev swig ruby-nokogiri libxml2-dev libxslt-dev build-base libressl-dev

RUN apk update \
&& apk add ruby \
           ruby-full \
           ruby-bigdecimal \
           ruby-bundler \
           ruby-io-console \
           ruby-irb \
           ca-certificates \
           libressl \
&& apk add --virtual build-dependencies \
           build-base \
           ruby-dev \
           libressl-dev \
\
&& bundle config build.nokogiri --use-system-libraries \
&& bundle config git.allow_insecure true \
&& gem install json --no-rdoc --no-ri \
\
&& gem cleanup \
&& apk del build-dependencies \
&& rm -rf /usr/lib/ruby/gems/*/cache/* \
          /var/cache/apk/* \
          /tmp/* \
          /var/tmp/*

RUN apk upgrade --no-cache binutils jq sudo unzip

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
RUN bash /tmp/consul_template_install.sh && rm /tmp/consul_template_install.sh

RUN addgroup $SERVICE_USER && adduser -h $SERVICE_ROOT -G $SERVICE_USER -s /bin/bash $SERVICE_USER -D
WORKDIR $SERVICE_ROOT

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/wait-for-it.sh /wait-for-it.sh
RUN chmod a+rx /wait-for-it.sh

RUN wget https://registry.npmjs.org/npm/-/npm-${NPM_VER}.tgz \
  && tar xzf npm-${NPM_VER}.tgz \
  && ./package/scripts/install.sh

ENTRYPOINT ["/entrypoint.sh"]
