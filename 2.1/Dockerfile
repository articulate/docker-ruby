FROM ruby:2.1

RUN apt-get update -qq \
  && apt-get -y install build-essential libpq-dev libqt4-dev git wget \
  libyaml-dev postgresql-client-9.4 xvfb nodejs \
  && rm -rf /var/lib/apt/lists/*

RUN curl -o /etc/ImageMagick-6/policy.xml https://s3.amazonaws.com/articulate-docker-assets/policy.xml
