FROM php:7-fpm-alpine
MAINTAINER АК Delfin <masterforweb@hotmail.com>

ENV IMAGICK_VERSION 3.4.1

# mysqli
RUN docker-php-ext-install mysqli \
	&& docker-php-ext-install opcache \
	&& apk add --no-cache imagemagick-dev libtool autoconf gcc g++ make \
	&& pecl install imagick-$IMAGICK_VERSION \
	&& echo "extension=imagick.so" > /usr/local/etc/php/conf.d/ext-imagick.ini \
    && apk del libtool autoconf gcc g++ make \
    && usermod -u 1000 www-data



