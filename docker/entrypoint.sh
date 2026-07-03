#!/bin/sh
set -e

# Railway injects PORT env — substitute in nginx config
LISTEN_PORT=${PORT:-8080}
sed -i "s/listen 8080/listen ${LISTEN_PORT}/g" /etc/nginx/nginx.conf
sed -i "s/listen \[::\]:8080/listen [::]:${LISTEN_PORT}/g" /etc/nginx/nginx.conf

exec /usr/bin/supervisord -c /etc/supervisord.conf
