#!/bin/sh

termination()
{
  echo "Terminating daemons ..." >> /var/log/run.log
  exit $?
}

echo "Running daemons ..." > /var/log/run.log
./seattle/start_seattle.sh
ps -ef | grep nmmain.py | grep -v grep

trap termination SIGINT

while true
do
  sleep 1000
done

