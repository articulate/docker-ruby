FROM ruby:2.2

RUN apt-get update -qq \
  && apt-get -y install build-essential libpq-dev libqt4-dev git wget \
  libyaml-dev postgresql-client-9.4 xvfb nodejs \
  && rm -rf /var/lib/apt/lists/*
