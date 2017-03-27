FROM certbot/certbot

RUN apk add --update netcat-openbsd && rm -rf /var/cache/apk/*

COPY crontab /var/spool/cron/crontabs/root
COPY *.sh /app/
COPY app.py /app/
RUN chmod +x /app/*.sh

EXPOSE 80

ENTRYPOINT ["sh", "/app/start.sh"]
