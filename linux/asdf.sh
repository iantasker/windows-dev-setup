#!/bin/bash

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.6

echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc
echo -e '\n\n Please restart your terminal session'
