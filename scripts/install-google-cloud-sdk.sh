#!/bin/bash -e

# Add repositories
wget -q -O - https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo sh -c 'echo "deb https://packages.cloud.google.com/apt cloud-sdk main" > /etc/apt/sources.list.d/google-cloud-sdk.list'

# Update repos
sudo apt update -y

# Install additional packages
sudo apt install google-cloud-sdk -y
