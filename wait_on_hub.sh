#!/bin/bash


export HUB_URL="http://$HUB_PORT_4444_TCP_ADDR:$HUB_PORT_4444_TCP_PORT"

attempt=0
until $(curl --output /dev/null --silent --head --fail $HUB_URL); do
    printf '.'
    attempt=$(expr $attempt + 1)
    if [ $attempt == "5" ]; then echo "Server $HUB_URL not found" && exit 1; fi
    sleep 2
done

echo "Starting entry point"
source /opt/bin/entry_point.sh
