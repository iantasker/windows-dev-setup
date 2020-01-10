#!/bin/bash

sudo apt-get -y install \
  php-json \
  php-mcrypt
  php-mbstring \
  php-token-stream \
  php-zip \
  php-json \
  php-xml \
  php-gd \
  php-opcache \
  php-curl \
  php-gettext \
  php-mysql

composer global require laravel/installer
composer global require laravel/spark-installer

sudo apt-get clean
