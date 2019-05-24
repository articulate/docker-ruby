# Debian-based image maintained by Ruby, see https://hub.docker.com/_/ruby for a full list of available images.
# Source for this base image can be found at https://github.com/docker-library/ruby/tree/master/2.4/stretch/slim
FROM ruby:2.5-slim-stretch

# Let's update and install the things.
# Run apt-get quietly (-qq) and say yes to prompts (-y)
# See best practices for apt-get in Docker at https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#run
# Notes:
#
RUN apt-get update -qq \
    && apt-get install -y git wget curl xvfb binutils jq sudo unzip \
    && apt-get upgrade -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /usr/share/doc /root/.cache/

# Install consul-template, which we'll use to pull in our environment variables
# If you want to know more on this, see the Platform 101 course, section "Consul and Vault"
ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
RUN bash /tmp/consul_template_install.sh && rm /tmp/consul_template_install.sh

# We use the following variables both in here and in downstream Dockerfiles
ENV SERVICE_ROOT /service
ENV SERVICE_USER service

# Create our service group and user, and set the directory where we'll work from going forward
RUN groupadd $SERVICE_USER && useradd --create-home --home $SERVICE_ROOT --gid $SERVICE_USER --shell /bin/bash $SERVICE_USER
WORKDIR $SERVICE_ROOT

# Make the wait-for-it script available to all projects.
# This is sometimes used by projects to make sure that supporting containers are up before the app starts.
# As an example, see the Makefile in the Heroes project.
ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/wait-for-it.sh /wait-for-it.sh
RUN chmod a+rx /wait-for-it.sh

# Our entrypoint will pull in our environment variables from Consul and Vault, and execute whatever command we provided the container.
# See https://github.com/articulate/docker-consul-template-bootstrap/blob/master/entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
