# tags=articulate/articulate-ruby:3.1-bullseye-slim-minimal
# syntax=docker/dockerfile:1
FROM ruby:3.1-slim-bullseye

ENV SERVICE_ROOT /service
ENV SERVICE_USER service

ARG TARGETARCH
ARG AWSCLI_VERSION=2.11.15
ADD --chmod=755 https://github.com/articulate/docker-bootstrap/releases/latest/download/docker-bootstrap_linux_${TARGETARCH} /entrypoint
ADD --chmod=755 https://raw.githubusercontent.com/articulate/docker-bootstrap/main/scripts/docker-secrets /usr/local/bin/secrets
ADD --chmod=755 https://raw.githubusercontent.com/vishnubob/wait-for-it/81b1373f17855a4dc21156cfe1694c31d7d1792e/wait-for-it.sh /wait-for-it.sh

RUN apt-get update -qq \
    && apt-get install --no-install-recommends -y \
        make git wget curl binutils jq sudo unzip ca-certificates dumb-init \
    && apt-get upgrade -y \
    && apt-get clean \
    && ln -s /entrypoint /entrypoint.sh \
    # AWSCLI (to be removed in a future release)
    && curl -s "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m)-${AWSCLI_VERSION}.zip" -o /tmp/awscliv2.zip \
    && unzip -d /tmp /tmp/awscliv2.zip \
    && /tmp/aws/install \
    # Create our service group and user
    && groupadd --gid 1001 $SERVICE_USER \
    && useradd --create-home --home $SERVICE_ROOT --shell /bin/bash --gid 1001 --uid 1001 $SERVICE_USER \
    # Cleanup
    && rm -rf /var/lib/apt/lists/* /usr/share/doc /root/.cache/ /tmp/*

WORKDIR $SERVICE_ROOT

# Our entrypoint will pull in our environment variables from Consul and Vault
# and execute whatever command we provided the container.
# See https://github.com/articulate/docker-bootstrap
ENTRYPOINT [ "dumb-init", "--", "/entrypoint" ]
