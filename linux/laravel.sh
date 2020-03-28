#!/bin/bash

sudo apt-get -y install \
  php-json \
  php-mbstring \
  php-token-stream \
  php7.2-zip \
  php-json \
  php-xml \
  php-gd \
  php7.2-opcache \
  php-curl \
  php-gettext \
  php-mysql

composer global require laravel/installer
composer global require laravel/spark-installer
composer global require laravel/vapor-cli

sudo apt-get clean
