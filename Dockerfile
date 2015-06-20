FROM ruby

RUN git clone https://github.com/kpadmanabhan/pact_broker; cp -r pact_broker/example /usr/local/pact_broker

RUN chmod +x -R /usr/local/pact_broker

WORKDIR /usr/local/pact_broker

RUN bundle install

EXPOSE 9292

ENTRYPOINT bundle exec rackup -p 9292 -o 0.0.0.0 /usr/local/pact_broker/config.ru
