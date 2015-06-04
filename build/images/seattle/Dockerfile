FROM resin/rpi-raspbian
# FROM debian:latest
MAINTAINER gmartins@cc.gatech.edu

RUN apt-get update
RUN apt-get install -yqf apt-utils
RUN apt-get install -yqf python 
RUN apt-get install -yqf procps net-tools cron vim wget
RUN apt-get clean
WORKDIR /opt/
RUN wget http://appnode.space/downloads/build/images/seattle/seattle_linux.tgz && tar xvzf seattle_linux.tgz
#RUN wget https://seattleclearinghouse.poly.edu/download/ggmartins/seattle_linux.tgz && tar xvzf seattle_linux.tgz
#RUN wget --no-check-certificate https://128.238.63.54/download/ggmartins/seattle_linux.tgz && tar xvzf seattle_linux.tgz
RUN yes | /opt/seattle/install.sh
RUN rm -f /opt/seattle_linux.tgz
ADD run.sh /opt/run.sh

