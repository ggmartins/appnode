#!/bin/bash


termination()
{
  echo "Terminating daemons ..." >> /var/log/run.log
  exit $?
}

echo "Running daemons ..." > /tmp/log/run.log
/etc/init.d/bismark-active start
/etc/init.d/bismark-data-transmit stop
/etc/init.d/bismark-data-transmit start
/etc/init.d/cron stop
/etc/init.d/cron start
touch /etc/cron.d/cron-bismark-mgmt
/usr/sbin/dropbear -p 2222 -P /var/run/dropbear_port2222.pid -s -g -d /etc/bismark/dropbear/ssh_host_dss_key -r /etc/bismark/dropbear/ssh_host_rsa_key

# Init BISmark ID for the device
if [ ! -e /etc/bismark/ID.init ];then
  if [ -e /etc/bismark/ID ];then
    mv /etc/bismark/ID /etc/bismark/ID.init
  else
    touch /etc/bismark/ID.init
  fi
  echo PI$(date +%y%m%d%H)$(awk 'BEGIN {srand(); printf "%04X\n", rand()*65535}') > /etc/bismark/ID
fi


trap termination SIGINT

while true
do
  sleep 1000
done


