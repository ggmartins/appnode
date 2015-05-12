#!/bin/bash

echo PI$(date +%y%m%d%H)$(awk 'BEGIN {srand(); printf "%04X\n", rand()*65535}') > /etc/bismark/ID



