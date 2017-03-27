#!/bin/sh

echo "Refreshing certificates..."
[ -z "$EMAIL" ] && echo "ERROR: Need to set EMAIL" && exit 1;
[ -z "$DOMAINS" ] && echo "ERROR: Need to set DOMAINS. Example: 'www.example.com,example.com'" && exit 1;


for i in $(echo $DOMAINS | tr "," "\n")
do
  domains="$domains -d ${i//[[:blank:]]/}"
done

echo $domains

certbot certonly --agree-tos --email $EMAIL --noninteractive --standalone --preferred-challenges http-01 $domains