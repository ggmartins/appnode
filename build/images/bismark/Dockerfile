FROM resin/rpi-raspbian
# FROM debian:latest
MAINTAINER gmartins@cc.gatech.edu

RUN apt-get update
RUN apt-get install -yq apt-utils procps net-tools cron vim wget
WORKDIR /opt/
RUN wget http://downloads.projectbismark.net/debian/bismarkdeb-install-armhf.sh && sh bismarkdeb-install-armhf.sh
RUN apt-get install -f -y
RUN rm -f /opt/*.deb
RUN apt-get clean
ADD init.sh /opt/init.sh
ADD run.sh /opt/run.sh

