#!/bin/bash -e

GPG_FILE=packages.microsoft.gpg

# Download deb packages
curl -s https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > $GPG_FILE
sudo install -D -o root -g root -m 644 $GPG_FILE /etc/apt/keyrings/$GPG_FILE
sudo sh -c "deb [arch=amd64 signed-by=/etc/apt/keyrings/$GPG_FILE] https://packages.microsoft.com/repos/code stable main > /etc/apt/sources.list.d/vscode.list"
rm -Rf $GPG_FILE

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install code -y

# Install extensions
code --install-extension vscodevim.vim
