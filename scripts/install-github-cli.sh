#!/bin/bash -e

# Add repositories
wget -q -O - https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo apt-key add -
sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] https://cli.github.com/packages stable main"' | sudo tee /etc/apt/sources.list.d/github-cli.list

# Update repos
sudo apt update -y

# Install additional packages
sudo apt install gh -y
