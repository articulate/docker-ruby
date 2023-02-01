# syntax=docker/dockerfile:1
FROM ruby:2.5-slim-stretch

ENV SERVICE_ROOT /service
ENV SERVICE_USER service

ARG TARGETARCH
ARG AWSCLI_VERSION=2.9.15
ADD --chmod=755 https://github.com/articulate/docker-consul-template-bootstrap/releases/latest/download/docker-consul-template-bootstrap_linux_${TARGETARCH} /entrypoint
ADD --chmod=755 https://raw.githubusercontent.com/vishnubob/wait-for-it/81b1373f17855a4dc21156cfe1694c31d7d1792e/wait-for-it.sh /wait-for-it.sh
ADD https://deb.nodesource.com/setup_12.x /tmp/setup-node.sh

# - postgresql-client requires the presence of man pages for some reason. Debian-slim doesn't have those by default, so we have to add those as a stub (source: https://github.com/dalibo/temboard/issues/211)
# - we install Imagemagick in our base image so we can keep it updated in one place, and so we can add a strict security policy by default (see further down)
# - We want npm in our base image. To get it, we must install nodejs. There is one in apt-get, but it's super old (version ~4). To get a newer node we must first add the nodesource PPA.
#   Source: https://github.com/nodesource/distributions/blob/master/README.md#deb
RUN mkdir -p /usr/share/man/man1 /usr/share/man/man7 \
    && bash /tmp/setup-node.sh \
    && apt-get update -qq \
    && apt-get install --no-install-recommends -y \
        build-essential imagemagick git wget curl xvfb binutils jq sudo unzip \
        qt5-default libyaml-dev libpq-dev postgresql-client-9.6 nodejs \
    && apt-get upgrade -y \
    && apt-get clean \
    && ln -s /entrypoint /entrypoint.sh \
    # AWSCLI (to be removed in a future release)
    && curl -s "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m)-${AWSCLI_VERSION}.zip" -o /tmp/awscliv2.zip \
    && unzip -d /tmp /tmp/awscliv2.zip \
    && /tmp/aws/install \
    # Create our service group and user
    && groupadd $SERVICE_USER && useradd --create-home --home $SERVICE_ROOT --gid $SERVICE_USER --shell /bin/bash $SERVICE_USER \
    # cleanup
    && rm -rf /var/lib/apt/lists/* /usr/share/doc /root/.cache/ /tmp/*

# Add a strict security policy for Imagemagick (note: Imagemagick 7 is currently not available in Debian)
COPY imagemagick-policy.xml /etc/ImageMagick-6/policy.xml

WORKDIR $SERVICE_ROOT

# Our entrypoint will pull in our environment variables from Consul and Vault
# and execute whatever command we provided the container.
# See https://github.com/articulate/docker-consul-template-bootstrap
ENTRYPOINT [ "/entrypoint" ]
