#!/bin/bash

if [ "$#" -ne 2 ]; then
   echo "Usage: $0 <network_prefix> <port>"
   echo "Example: $0 10.0.5 53"
   exit 1
fi

network_prefix=$1
port=$2

echo "IP,Port,Status"

for ip in $(seq 1 254); do
    full_ip="$network_prefix.$ip"

    timeout .1 bash -c "echo >/dev/tcp/$full_ip/$port" 2>/dev/null


    if [ $? -eq 0 ]; then
       echo "$full_ip,$port,OPEN"
    fi


done
