FROM php:5.6-apache
COPY ./php.ini /usr/local/etc/php

RUN docker-php-ext-install pdo pdo_mysql mysql && \
  a2enmod rewrite
