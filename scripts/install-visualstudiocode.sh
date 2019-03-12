#!/bin/bash -e

# Specify version
app=code
ver=1.32.1-1552006243_amd64
arch=amd64
package=${app}_${ver}_${arch}.deb
cdn_hash=05f146c7a8f7f78e80261aa3b2a2e642586f9eb3

# Download deb packages
curl -s https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install code -y

# Install extensions
code --install-extension vscodevim.vim
#code --install-extension ms-vscode.cpptools
#code --install-extension lukehoban.Go
#code --install-extension donjayamanne.python
