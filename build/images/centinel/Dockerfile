FROM resin/rpi-raspbian
# FROM debian:latest
MAINTAINER gmartins@cc.gatech.edu

RUN apt-get update
RUN apt-get install -yqf apt-utils
RUN apt-get install -yqf python-pip libssl-dev swig python-dev libffi-dev
RUN pip install -U dnspython requests argparse m2crypto pyopenssl ndg-httpsclient pyasn1 pip
RUN pip install centinel
RUN apt-get install -yqf procps net-tools cron vim wget
RUN apt-get clean
ADD etc/cron.hourly/centinel /etc/cron.hourly/centinel
ADD etc/cron.daily/centinel-autoupdate /etc/cron.daily/centinel-autoupdate
WORKDIR /opt/
ADD run.sh /opt/run.sh
