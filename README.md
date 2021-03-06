# pact-broker-docker

## Dockerising Pact Broker

It uses [Pact broker ruby gem][pactbroker-gem] created from [original pact broker repository][bs-pack_broker].

[bs-pack_broker]: [https://github.com/bethesque/pact_broker]
[pactbroker-gem]: [https://rubygems.org/gems/pact_broker]

## Docker registry
Docker image [kpadmanabhan/pact-broker-docker][pact-broker-docker]
[pact-broker-docker]:[https://registry.hub.docker.com/u/kpadmanabhan/pact-broker-docker/]
[docker-reg-link]:[https://registry.hub.docker.com/u/kpadmanabhan/pact-broker-docker/]

## Deploying on aws elastic bean stalk

It just should require a new Dockerfilerun.aws.json like below -  you should be all good to go

```
{
  "AWSEBDockerrunVersion": "1",
  "Image": {
    "Name": "kpadmanabhan/pact-broker-docker",
    "Update": "true"
  },
  "Logging": "/var/log/nginx"
}
```

## Usage instructions
For running the docker image generated by this, following environment variables required.

```
PACT_BROKER_DATABASE_USERNAME
PACT_BROKER_DATABASE_PASSWORD
PACT_BROKER_DATABASE_HOST
PACT_BROKER_DATABASE_NAME
```

These variables can be either passed along with docker run command or permanently set up on eb like environment where it will be deployed.

## Vagrant users note

There are place holders in vagrant file to capture above mentioned env variable, substitute with actual values.
