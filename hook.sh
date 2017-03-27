#!/bin/sh
echo "Restarting nginx ... "
echo -e "POST /containers/$NGINX/restart?stream=0 HTTP/1.1\r\nHost: localhost\n" | nc -U /var/run/docker.sock
