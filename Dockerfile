FROM ruby:3.1.2
LABEL Sergio López <lopez.sergio.n@gmail.com>

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn tzdata

WORKDIR /usr/src/app


RUN gem install rails -v '7.0.3'

ADD Gemfile Gemfile.lock /usr/src/app/
RUN bundle install


#Add a script to be executed every time the container starts.
COPY ./.docker/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]