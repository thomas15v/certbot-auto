#!/bin/sh
sleep 1
sh /app/run.sh
crond
python /app/app.py