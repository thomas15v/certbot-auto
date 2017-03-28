#!/bin/sh

if [ -f /app/pid ]; then
    echo "Killing redirect server"
    kill -9 `cat /app/pid`
    rm /app/pid
fi

echo "Refreshing certificates..."
[ -z "$EMAIL" ] && echo "ERROR: Need to set EMAIL" && exit 1;
[ -z "$DOMAINS" ] && echo "ERROR: Need to set DOMAINS. Example: 'www.example.com,example.com'" && exit 1;
[ -z "$NGINX" ] && echo "ERROR: A nginx container name has to be set!" && exit 1;


for i in $(echo $DOMAINS | tr "," "\n")
do
  domains="$domains -d ${i//[[:blank:]]/}"
done

certbot certonly --agree-tos --email $EMAIL \
    --renew-hook "sh /app/hook.sh" \
    --noninteractive --standalone --preferred-challenges http-01 $domains
sleep 10
echo -e "POST /containers/$NGINX/start?stream=0 HTTP/1.1\r\nHost: localhost\n" | nc -U /var/run/docker.sock

echo "starting redirect server"

nohup python /app/app.py &
echo $! > /app/pid