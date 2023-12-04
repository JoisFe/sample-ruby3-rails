FROM ruby:3.2.2-slim

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libvips pkg-config

RUN gem install rails

WORKDIR /usr/local/app

COPY . .
RUN bundle install

EXPOSE 3000
ENTRYPOINT bundle exec rails server -b 0