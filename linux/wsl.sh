#!/bin/bash

sudo tee /etc/wsl.conf <<EOL
[automount]
root = /
options = "metadata"
EOL
