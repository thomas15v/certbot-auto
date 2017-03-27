FROM certbot/certbot

COPY crontab /var/spool/cron/crontabs/root
COPY *.sh /app/
COPY app.py /app/
RUN chmod +x /app/*.sh

EXPOSE 80

ENTRYPOINT ["sh", "/app/start.sh"]
