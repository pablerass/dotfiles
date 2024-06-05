#!/bin/bash -e

KEYRING=/etc/apt/keyrings/google.pub

# Add repositories
curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o $KEYRING
echo "deb [arch=amd64 signed-by=$KEYRING] http://dl.google.com/linux/chrome/deb/ stable main" | \
    sudo tee /etc/apt/sources.list.d/google-chrome.list

# Update repos
sudo apt update -y

# Install additional packages
sudo apt install google-chrome-stable -y
