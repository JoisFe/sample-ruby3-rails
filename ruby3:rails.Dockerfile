FROM ruby:3.2.2-slim

# CHECK gem install
RUN gem -v

# CHECK rails install
RUN #gem install rails
#RUN rails -v

# CHECK bundle install
RUN bundle -v

WORKDIR /usr/local/app

#COPY . .
#RUN bundle install

#EXPOSE 3000
#ENTRYPOINT rails server