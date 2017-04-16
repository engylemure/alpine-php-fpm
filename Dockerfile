FROM php:7-fpm-alpine
MAINTAINER Andre Metzen <metzen@conceptho.com>

# PHP Extensions
# json, zlib, xml, pdo, phar, curl, openssl, dom, intl, ctype, pdo_mysql, mysqli, opcache, memcached, redis, gd, iconv
# mcrypt, mbstring, session

# Pecl Extensions
# memcached redis

ENV TERM=xterm

RUN apk add --update libxml2-dev openssl-dev bash curl-dev icu-dev git ca-certificates nodejs freetype-dev libjpeg-turbo-dev libpng-dev libmcrypt-dev nano

RUN docker-php-ext-install json xml pdo phar curl dom intl ctype pdo_mysql mysqli opcache gd iconv session mbstring
RUN pecl channel-update pecl.php.net
RUN pecl install redis-3.1.2
RUN pecl install memcached-3.0.3

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/bin/composer

COPY php.ini /usr/local/etc/php/