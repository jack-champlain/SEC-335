#!/bin/bash
if [ "$#" -ne 2 ]; then
   echo "Usage: $0 <network_prefix> <dns_servers>"
   echo "Example: $0 10.0.5 8.8.8.8"
   exit 1
fi

network_prefix=$1
dns_server=$2

for ip in $(seq 1 254); do
    full_ip="$network_prefix.$ip"

    result=$(nslookup $full_ip $dns_server 2>/dev/null | grep 'name =')

    if [ -n "$result" ]; then
        echo "$full_ip - DNS result: $result"
    fi
done
