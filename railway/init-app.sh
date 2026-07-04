#!/bin/bash
set -e

php artisan key:generate --force
php artisan migrate --force
php artisan db:seed --class=AdminSeeder --force --no-interaction || true
php artisan storage:link --force
php artisan optimize:clear
php artisan config:cache
php artisan event:cache
php artisan route:cache
php artisan view:cache
