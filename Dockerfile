FROM ruby:2.6.3

RUN apt-get update -qq && \
  apt-get install -y build-essential \
  libpq-dev \
  nodejs \
  default-mysql-client \
  --no-install-recommends && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir /enshare-backend
ENV APP_ROOT /enshare-backend
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD . $APP_ROOT