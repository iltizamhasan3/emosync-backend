FROM php:8.4-fpm-alpine

# Install system dependencies & PHP extensions
RUN apk add --no-cache \
    nginx \
    supervisor \
    curl \
    libpng-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    postgresql-dev \
    $PHPIZE_DEPS \
    linux-headers \
    && docker-php-ext-install pdo_mysql pdo_pgsql bcmath gd \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apk del $PHPIZE_DEPS linux-headers

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Copy codebase
COPY . .

# Install dependencies (production mode)
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Ensure required directories exist and set permissions
RUN mkdir -p \
        storage/framework/sessions \
        storage/framework/views \
        storage/framework/cache \
        storage/framework/testing \
        storage/logs \
        storage/app/public \
        bootstrap/cache \
    && chown -R www-data:www-data storage bootstrap/cache

# Copy runtime configs
COPY docker/nginx.conf /etc/nginx/nginx.conf
COPY docker/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY docker/supervisord.conf /etc/supervisord.conf
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
