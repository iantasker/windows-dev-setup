#!/bin/bash

## Set up repositories and keys
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y install \
  automake \
  autoconf \
  make \
  libtool \
  build-essential \
  apt-transport-https \
  ca-certificates \
  curl \
  composer \
  software-properties-common \
  postgresql \
  libncurses-dev \
  libncurses5-dev \
  libncursesw5-dev \
  libpq-dev \
  libyaml-dev \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libxslt-dev \
  libreadline-dev \
  libsqlite3-dev \
  unixodbc-dev \
  wget \
  curl \
  llvm \
  xz-utils \
  tk-dev \
  libffi-dev \
  libnss3 \
  libgmp3-dev \
  libjpeg-dev \
  libpng-dev \
  google-chrome-stable \
  redis-server \
  graphviz \
  haskell-platform \
  git \
  debhelper \
  dh-make \
  dwz \
  gettext-doc \
  libasprintf-dev \
  libgettextpo-dev \
  zsh \
  vim \
  xfce4 \
  x11-utils \
  jq \
  openssl \
  libcurl4-openssl-dev \
  pkg-config \
  libicu-dev \
  libxml2-dev \
  gettext \
  bison \
  libmysqlclient-dev \
  libedit-dev \
  libonig-dev \
  re2c

tee $HOME/.shellrc <<EOL
# Include .config/composer/vendor/bin in path
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
EOL
