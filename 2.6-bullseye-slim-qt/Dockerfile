FROM ruby:2.6-slim-bullseye

ENV SERVICE_ROOT /service
ENV SERVICE_USER service

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/wait-for-it.sh /wait-for-it.sh
ADD https://deb.nodesource.com/setup_16.x /tmp/setup-node.sh

# - postgresql-client requires the presence of man pages for some reason. Debian-slim doesn't have those by default, so we have to add those as a stub (source: https://github.com/dalibo/temboard/issues/211)
# - we install Imagemagick in our base image so we can keep it updated in one place, and so we can add a strict security policy by default (see further down)
# - We want npm in our base image. To get it, we must install nodejs. There is one in apt-get, but it's super old (version ~4). To get a newer node we must first add the nodesource PPA.
#   Source: https://github.com/nodesource/distributions/blob/master/README.md#deb
RUN mkdir -p /usr/share/man/man1 /usr/share/man/man7 \
    && bash /tmp/setup-node.sh \
    && apt-get update -qq \
    && apt-get install --no-install-recommends -y \
        build-essential imagemagick git wget curl xvfb binutils jq sudo unzip \
        qt5-default libqt5webkit5-dev libyaml-dev libpq-dev postgresql-client-9.6 \
        nodejs \
    && apt-get upgrade -y \
    && apt-get clean \
    # Consul template
    && bash /tmp/consul_template_install.sh \
    # Create our service group and user
    && groupadd $SERVICE_USER && useradd --create-home --home $SERVICE_ROOT --gid $SERVICE_USER --shell /bin/bash $SERVICE_USER \
    # Make wait-for-it executable
    && chmod a+rx /wait-for-it.sh \
    # cleanup
    && rm -rf /var/lib/apt/lists/* /usr/share/doc /root/.cache/ /tmp/*

# Add a strict security policy for Imagemagick (note: Imagemagick 7 is currently not available in Debian)
COPY imagemagick-policy.xml /etc/ImageMagick-6/policy.xml

WORKDIR $SERVICE_ROOT

# Our entrypoint will pull in our environment variables from Consul and Vault
# and execute whatever command we provided the container.
# See https://github.com/articulate/docker-consul-template-bootstrap/blob/master/entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
