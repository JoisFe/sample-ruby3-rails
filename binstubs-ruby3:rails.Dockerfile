# for binstubs project build&run
FROM ruby:3.2.2-slim

RUN apt-get update -qq apt-get install --no-install-recommends -y build-essential libvips pkg-config

ENV WORK_DIRECTORY="/usr/local/app"
ENV BUNDLE_PATH="$WORK_DIRECTORY/.bundle"
#ENV GEM_PATH="$WORK_DIRECTORY/.gem"

WORKDIR $WORK_DIRECTORY

COPY . .

# 디폴트 포트 명시(외부 포트 변경하지 않는 경우 필요없는 옵션)
EXPOSE 3000
ENTRYPOINT ./bin/rails server -b 0