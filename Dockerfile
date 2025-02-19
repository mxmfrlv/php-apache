FROM php:8.4-apache

COPY ./etc/ports.conf /etc/apache2/
COPY ./etc/000-default.conf /etc/apache2/sites-available/
COPY ./etc/php.ini /usr/local/etc/php/
COPY ./etc/docker-php-entrypoint /usr/local/bin/

EXPOSE 8080

# based on  https://github.com/asimlqt/docker-php/blob/master/apache/8.3/Dockerfile
RUN set -x \
    && a2enmod rewrite \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        git \ 
        wget \
        dumb-init \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libssl-dev \
        libicu-dev \
        libbz2-dev \
        libssh2-1-dev \
        libgmp-dev \
        libpq-dev \
        libzip-dev \
        libpcre2-dev \
        librdkafka-dev \
        socat \
    && apt-get clean \
    && useradd -m admin \
    && docker-php-ext-install -j$(nproc) sockets bcmath exif intl mysqli opcache pdo_mysql zip \
    && docker-php-ext-configure sockets --enable-sockets \
    && docker-php-ext-configure bz2 --with-bz2=/usr/include/ \
    && docker-php-ext-install -j$(nproc) bz2 \
    && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pgsql pdo_pgsql \
    && docker-php-ext-install -j$(nproc) gmp \
    && pecl install --onlyreqdeps --force apcu-5.1.24 \
    && pecl install mongodb-1.20.1 \
    && pecl install --onlyreqdeps --force redis-6.1.0 \
    && pecl install --onlyreqdeps --force rdkafka-6.0.5 \
    && docker-php-ext-enable apcu mongodb redis rdkafka \
    && wget -O /usr/local/bin/composer "https://getcomposer.org/composer.phar" \
    && chmod +x /usr/local/bin/composer \
    && chown -R www-data:www-data /var/www/html \
    && chmod +x /usr/local/bin/docker-php-entrypoint

