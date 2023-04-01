FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /petblog
WORKDIR /petblog
COPY Gemfile /petblog/Gemfile
COPY Gemfile.lock /petblog/Gemfile.lock
RUN bundle install
COPY . /petblog