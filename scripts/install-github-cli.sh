#!/bin/bash -e

KEYRING=/etc/apt/keyrings/githubcli-archive-keyring.gpg

# Add repositories
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o $KEYRING
echo "deb [arch=$(dpkg --print-architecture) signed-by=$KEYRING] https://cli.github.com/packages stable main" | \
    sudo tee /etc/apt/sources.list.d/github-cli.list

# Update repos
sudo apt update -y

# Install additional packages
sudo apt install gh -y
