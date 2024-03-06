FROM php:8.3-fpm-bullseye
RUN apt-get update \
  && apt-get install -y mariadb-client libzip-dev libicu-dev unzip wget git unzip libmemcached-dev zlib1g-dev libpng-dev libjpeg62-turbo-dev libwebp-dev libmagickwand-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-install zip pdo_mysql sockets opcache intl pcntl \
  && pecl install memcached \
  && docker-php-ext-enable memcached \
  && docker-php-ext-configure gd --with-jpeg --with-webp \
  && docker-php-ext-install -j$(nproc) gd \
  && pecl install xdebug \
  && docker-php-ext-enable xdebug

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

