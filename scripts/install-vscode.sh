#!/bin/bash -e

# Download deb packages
curl -s https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install code -y

# Install extensions
code --install-extension vscodevim.vim
