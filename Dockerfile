FROM ruby:2.7 AS builder
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

EXPOSE 3000

CMD ["rails", "server", "-p", "3000", "-b", "0.0.0.0"]