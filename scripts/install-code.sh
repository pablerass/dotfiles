#!/bin/bash -e

GPG_KEY=packages.microsoft.gpg
KEYRING=/etc/apt/keyrings/$GPG_KEY

# Add repositories
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > $GPG_KEY
sudo install -D -o root -g root -m 644 $GPG_KEY $KEYRING
echo "deb [arch=amd64 signed-by=$KEYRING] https://packages.microsoft.com/repos/vscode stable main" | \
    sudo tee /etc/apt/sources.list.d/vscode.list
rm -f $GPG_KEY

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install code -y

# Install extensions
code --install-extension vscodevim.vim
