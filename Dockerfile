FROM certbot/certbot

COPY crontab /var/spool/cron/crontabs/root
COPY *.sh /app/
RUN chmod +x /app/*.sh

EXPOSE 443

ENTRYPOINT ["sh", "/app/start.sh"]
