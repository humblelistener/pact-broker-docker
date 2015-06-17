FROM dius/pact_broker 
ENV PACT_BROKER_DATABASE_USERNAME broker
ENV PACT_BROKER_DATABASE_PASSWORD rB0kl3rFOO
ENV PACT_BROKER_DATABASE_HOST pact-default.c4p7g8ccwlnj.ap-southeast-2.rds.amazonaws.com
ENV PACT_BROKER_DATABASE_NAME broker
# docker run dius/pact_broker CMD /usr/local/bin/rackup -o 0.0.0.0 -p 80
EXPOSE 80
CMD ["/usr/local/bin/rackup"]