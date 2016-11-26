FROM php:7-fpm-alpine
MAINTAINER АК Delfin <masterforweb@hotmail.com>

ENV IMAGICK_VERSION 3.4.1

# mysqli
RUN docker-php-ext-install mysqli \
	&& docker-php-ext-install opcache \
	&& apk add --no-cache imagemagick-dev libtool autoconf gcc g++ make \
	&& pecl install imagick-$IMAGICK_VERSION \
	&& echo "extension=imagick.so" > /usr/local/etc/php/conf.d/ext-imagick.ini \
    && apk del libtool autoconf gcc g++ make 

# ensure www-data user exists
RUN set -x \
	&& addgroup -g 1000 -S arlemp \
	&& adduser -u 1000 -D -S -G arlemp arlemp    



