FROM ruby

ENV PACT_BROKER_DATABASE_USERNAME broker

ENV PACT_BROKER_DATABASE_PASSWORD rB0kl3rFOO

ENV PACT_BROKER_DATABASE_HOST pact-default.c4p7g8ccwlnj.ap-southeast-2.rds.amazonaws.com

ENV PACT_BROKER_DATABASE_NAME broker

RUN git clone https://github.com/kpadmanabhan/pact_broker; cp -r pact_broker/example /usr/local/pact_broker

RUN chmod +x -R /usr/local/pact_broker

WORKDIR /usr/local/pact_broker

RUN bundle install

EXPOSE 9292

ENTRYPOINT bundle exec rackup -p 9292 /usr/local/pact_broker/config.ru
