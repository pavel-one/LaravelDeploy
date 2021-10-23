FROM php:8-fpm

# Аргументы принимающие из docker-compose.yml
ARG user
ARG uid

# Установка зависимостей
RUN apt-get update && apt-get install -y \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    libmagickwand-dev \
    imagemagick \
    zlib1g-dev \
    libzip-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libpq-dev

# Установка расширений php
RUN docker-php-ext-install pdo pdo_pgsql pgsql mbstring exif pcntl bcmath gd zip

# Redis
RUN pecl install -o -f redis \
&&  rm -rf /tmp/pear \
&&  docker-php-ext-enable redis

# Image Magick
RUN printf "\n" | pecl install imagick
RUN docker-php-ext-enable imagick gd

# Последний композер
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Установка рабочей директории
WORKDIR /var/www

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]