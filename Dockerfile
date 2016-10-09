FROM php:7-fpm-alpine
MAINTAINER АК Delfin <masterforweb@hotmail.com>

ENV IMAGICK_VERSION 3.4.1

# mysqli
RUN docker-php-ext-install mysqli

# opcache
RUN docker-php-ext-install opcache

# Imagick
RUN apk add --no-cache imagemagick-dev libtool autoconf gcc g++ make \
    && pecl install imagick-$IMAGICK_VERSION \
    && echo "extension=imagick.so" > /usr/local/etc/php/conf.d/ext-imagick.ini \
    && apk del libtool autoconf gcc g++ make

# composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer.phar
RUN chmod +rx /usr/local/bin/composer.phar
RUN chmod +x /usr/local/bin/composer    