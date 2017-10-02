#!/usr/bin/env bash

# Loop until the post succeeds - handles the case where Grafana conatiner is live but not ready
until curl -s -H "Content-Type: application/json" -X POST -d '{"name":"prometheus-dev","type":"prometheus","url":"http://prometheus:9090","access":"proxy"}' http://admin:password@localhost:3000/api/datasources 2>&1 > /dev/null;
do
    echo "Waiting for Grafana to be ready..."
    sleep 1
done
