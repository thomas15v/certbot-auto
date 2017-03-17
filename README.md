# cerbot-auto
Certbot with build in cron

## Usage:
Define these 2 environment variables:
- EMAIL
- DOMAINS

That will run cerbot in standalone mode on port 443. You will have to proxy that trough your gninx/appache container.
See official certbot documentation


## features
This image will run the certbot command every month and when restarted.