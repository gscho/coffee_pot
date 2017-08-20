FROM ruby:2.2.7
MAINTAINER Greg Schofield <gregs@indellient.com>

RUN apt-get update && \
    apt-get install -y net-tools

ENV APP_HOME /app
ENV HOME /root
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/
RUN bundle install

COPY . $APP_HOME

ENV PORT 9292
EXPOSE 9292
CMD ["ruby", "coffee.rb"]
