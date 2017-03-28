# cerbot-auto
Certbot with build in cron

## Usage:
Define these environment variables:
- EMAIL:        Email address required for validation
- DOMAINS:      Comma separated list of domains
- NGINX:        The name of the nginx container you want to restart if certificates are valid (nginx will crash first time)

This certbot image creates certificates and makes sure they stay up to date. The image also has a small http server that routes all http requests to https://. This way you can full dedicate port 80 to this container. What shouldn't be a problem since you are using this to get https. If you still want custom rewrite rules do it in your nginx container.

Check the github repo for a docker-compose usage example.
