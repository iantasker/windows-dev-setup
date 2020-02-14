#!/bin/bash

###
# Set up Git
#
export WIN_USER="$(echo -e `powershell.exe '$env:UserName'` | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

cp "/c/Users/${WIN_USER}/.gitconfig" "/home/${USER}/.gitconfig"

if [ -f "/c/Users/${WIN_USER}/.ssh/id_rsa.pub" ]; then
  echo "Found SSH key!"
  ln -sf "/c/Users/${WIN_USER}/.ssh" "/home/${USER}/"
else
  sudo mkdir -p "/c/Users/${WIN_USER}/.ssh"
  ln -sf "/c/Users/${WIN_USER}/.ssh" "/home/${USER}/"
  echo "No SSH key found, creating..."
  ssh-keygen -t rsa -b 4096 -C "${GIT_EMAIL}"
  eval $(ssh-agent -s)
  ssh-add "/home/${USER}/.ssh/id_rsa"
  echo ""
  echo ""
  echo "Add this to GIT SSH:"
  echo "---"
  cat "/home/${USER}/.ssh/id_rsa.pub"
  echo "---"
  echo ""
  echo ""
  read -n1 -r -p "Press any key to continue..." key
fi
