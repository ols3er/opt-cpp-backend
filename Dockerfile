# to build:
# docker build -t="pgbovine/opt-cpp-backend:v1" .
#
# to test:
# docker run -t -i --rm --user=netuser --net=none --cap-drop all pgbovine/opt-cpp-backend:v1 bash
#
# remember --rm or else stale old containers will be left around!
# use "docker ps -a" to see all containers

# don't use 'latest' tag since that might change
FROM ubuntu:14.04.1
MAINTAINER Philip Guo <philip@pgbovine.net>

# if apt-get doesn't work, then follow these instructions:
# http://stackoverflow.com/questions/24991136/docker-build-could-not-resolve-archive-ubuntu-com-apt-get-fails-to-install-a
# Uncomment the following line in /etc/default/docker DOCKER_OPTS="--dns 8.8.8.8 --dns 8.8.4.4"
# Restart the Docker service sudo service docker restart
#
# to get gcc and g++
RUN apt-get update && apt-get install -y \
  build-essential \
  autotools-dev \
  automake

RUN mkdir /tmp/opt-cpp-backend
RUN mkdir /tmp/opt-cpp-backend/valgrind-3.11.0

ADD valgrind-3.11.0 /tmp/opt-cpp-backend/valgrind-3.11.0

RUN useradd netuser
