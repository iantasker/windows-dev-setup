#!/bin/bash

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.6

echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc

###
# Install Programming languages and build tools
# - Python
asdf plugin-add python
asdf install python 2.7.15
asdf global python 2.7.15
curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
python /tmp/get-pip.py
# - Ruby
asdf plugin-add ruby
sudo apt-get -y purge libssl-dev && sudo apt-get -y install libssl1.0-dev
asdf install ruby 2.3.1
sudo apt-get -y purge libssl1.0-dev && sudo apt-get -y install libssl-dev
asdf install ruby 2.4.2
asdf install ruby 2.4.6
asdf global ruby 2.4.6
gem install rubocop ruby-debug-ide debase
# - Node xx
asdf plugin-add nodejs
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 10.7.0
asdf global nodejs 10.7.0
npm install -g lint-staged husky prettier mermaid.cli
# - Java xx
asdf plugin-add java
asdf install java oracle-8.181
asdf global java oracle-8.181
# - Maven
asdf plugin-add maven
asdf install maven 3.5.2
asdf global maven 3.5.2
# - PHP
asdf plugin-add php https://github.com/odarriba/asdf-php.git
asdf install php 7.2.0
asdf global php 7.2.0

# Allow legacy config files
tee $HOME/.asdfrc <<EOL
legacy_version_file = yes
EOL

tee $HOME/.shellrc <<EOL
# Set up Java
asdf_update_java_home() {
  local current
  if current=$(asdf current java); then
    local version=$(echo $current | sed -s 's|\(.*\) \?(.*|\1|g')
    export JAVA_HOME=$(asdf where java $version)
  else
    echo "No java version set. Type `asdf list-all java` for all versions."
  fi
}
asdf_update_java_home
EOL
