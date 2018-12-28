#!/bin/sh

URL="https://services.sapo.pt/PunyUrl/DNS/UpdateDNS?domain=${DOMAIN}&record_type=A&ESBUsername=${USERNAME}&ESBPassword=${PASSWORD}"

while true
do
    curl -sL $URL | grep result
    sleep 900
done
