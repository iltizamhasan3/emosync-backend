#!/bin/sh
set -e

# Railway injects PORT env — substitute in nginx config
LISTEN_PORT=${PORT:-8080}
sed -i "s/listen 8080/listen ${LISTEN_PORT}/g" /etc/nginx/nginx.conf
sed -i "s/listen \[::\]:8080/listen [::]:${LISTEN_PORT}/g" /etc/nginx/nginx.conf

# Ensure APP_KEY is set
if [ -z "$APP_KEY" ] || [ "$APP_KEY" = "SomeRandomString" ]; then
    php artisan key:generate --force
fi

# Storage link
php artisan storage:link --no-interaction 2>/dev/null || true

# Run migrations on startup (safe for Railway)
php artisan migrate --force --no-interaction 2>/dev/null || true

exec /usr/bin/supervisord -c /etc/supervisord.conf
