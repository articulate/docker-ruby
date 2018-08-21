FROM ruby:2.4.4-alpine3.7

ENV SERVICE_ROOT /service
ENV SERVICE_USER service
ENV NPM_VER=6.1.0

RUN apk add --no-cache make libpq qt git curl wget yaml postgresql-client xvfb bash nodejs binutils jq sudo unzip

RUN apk upgrade --no-cache binutils jq sudo unzip

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
RUN bash /tmp/consul_template_install.sh && rm /tmp/consul_template_install.sh

RUN addgroup $SERVICE_USER && adduser -h $SERVICE_ROOT -G $SERVICE_USER -s /bin/bash $SERVICE_USER -D
WORKDIR $SERVICE_ROOT

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/wait-for-it.sh /wait-for-it.sh
RUN chmod a+rx /wait-for-it.sh

RUN npm uninstall npm -g
RUN wget https://registry.npmjs.org/npm/-/npm-${NPM_VER}.tgz \
  && tar xzf npm-${NPM_VER}.tgz \
  && ./package/scripts/install.sh

ENTRYPOINT ["/entrypoint.sh"]
