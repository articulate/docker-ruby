FROM ruby:3.1-slim-bullseye

ENV SERVICE_ROOT /service
ENV SERVICE_USER service

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/wait-for-it.sh /wait-for-it.sh

RUN apt-get update -qq \
    && apt-get install --no-install-recommends -y \
        make git wget curl binutils jq sudo unzip \
    && apt-get upgrade -y \
    && apt-get clean \
    # Consul template
    && bash /tmp/consul_template_install.sh \
    # Make wait-for-it executable
    && chmod a+rx /wait-for-it.sh \
    # Create our service group and user
    && groupadd $SERVICE_USER && useradd --create-home --home $SERVICE_ROOT --gid $SERVICE_USER --shell /bin/bash $SERVICE_USER \
    # Cleanup
    && rm -rf /var/lib/apt/lists/* /usr/share/doc /root/.cache/ /tmp/*

WORKDIR $SERVICE_ROOT

# Our entrypoint will pull in our environment variables from Consul and Vault
# and execute whatever command we provided the container.
# See https://github.com/articulate/docker-consul-template-bootstrap/blob/master/entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
