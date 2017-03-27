# cerbot-auto
Certbot with build in cron

## Usage:
Define these 2 environment variables:
- EMAIL:        Email address required for validation
- DOMAINS:      Comma separated list of domains
- NGINX:        The name of the nginx container you want to restart if certificates are valid (nginx will crash first time)

This certbot image creates certificates and makes sure they stay up to date. The image also has a small http server
that routes all http requests to https://. This way you don't need any other proxy validations and since all traffic
should go trough https. This shouldn't be a problem. If you still want custom rewrite rules do it in your nginx container.

Check the github repo for a docker-compose example.