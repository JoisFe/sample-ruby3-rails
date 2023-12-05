FROM ruby:3.2.2-slim AS base

RUN apt-get update -qq

# install for bundle install
RUN apt-get install --no-install-recommends -y build-essential libvips pkg-config

ENV WORK_DIRECTORY="/usr/local/app"
ENV BUNDLE_PATH="$WORK_DIRECTORY/.bundle"

WORKDIR $WORK_DIRECTORY

FROM base AS build

COPY . .
RUN bundle install && bundle binstubs --all

FROM base

COPY --from=build $WORK_DIRECTORY $WORK_DIRECTORY

# 디폴트 포트 명시(외부 포트 변경하지 않는 경우 필요없는 옵션)
EXPOSE 3000
ENTRYPOINT ./bin/rails server -b 0