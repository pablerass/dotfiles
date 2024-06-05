#!/bin/bash -e

KEYRING=/etc/apt/keyrings/microsoft.asc

# Add repositories
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o $KEYRING
echo "deb [arch=amd64 signed-by=$KEYRING] https://packages.microsoft.com/repos/vscode stable main" | \
    sudo tee /etc/apt/sources.list.d/vscode.list

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install code -y

# Install extensions
code --install-extension vscodevim.vim
