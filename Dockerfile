FROM ruby:2.1.3

MAINTAINER Dan Sabin <dan.sabin@gmail.com>

ADD . /var/learn-2-code

WORKDIR /var/learn-2-code

RUN bundle install