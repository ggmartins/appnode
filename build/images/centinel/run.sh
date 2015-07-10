#!/bin/sh

termination()
{
  echo "Terminating daemons ..." >> /var/log/run.log
  exit $?
}

echo "Running daemons ..." > /var/log/run.log

trap termination SIGINT

while true
do
  sleep 1000
done
