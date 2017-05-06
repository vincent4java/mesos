FROM ubuntu:16.04
MAINTAINER v4java
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse" > /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse" >>/etc/apt/sources.list
RUN apt-get update
RUN apt-get install apt-transport-https ca-certificates -y
#RUN apt-get install linux-image-extra-$(uname -r) -y
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list
#RUN apt-get install linux-image-extra-$(uname -r)
RUN apt-get update
RUN apt-get install docker-engine -y
RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
  apt-get -y update && \
  apt-get -y install openjdk-8-jdk mesos && \
  apt-get clean && rm -rf /var/lib/apt/lists/*
