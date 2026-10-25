#!/bin/bash -e

VERSION=24.x
DISTRO=nodistro
KEYRING=/etc/apt/keyrings/nodesource.gpg.key

# Remove previous repositories
sudo rm -f /etc/apt/sources.list.d/nodesource.list /etc/apt/keyrings/deb.nodesource.gpg $KEYRING

# Add repositories
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o $KEYRING
sudo sh -c "echo deb [arch=$(dpkg --print-architecture) signed-by=$KEYRING] https://deb.nodesource.com/node_$VERSION $DISTRO main > /etc/apt/sources.list.d/nodesource.list"

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install nodejs -y
