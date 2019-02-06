#!/bin/bash -e

source /etc/lsb-release

VERSION=6.x
DISTRO=$DISTRIB_CODENAME

# Add repositories
curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
sudo sh -c "echo deb https://deb.nodesource.com/node_$VERSION $DISTRO main > /etc/apt/sources.list.d/nodesource.list"
sudo sh -c "echo deb-src https://deb.nodesource.com/node_$VERSION $DISTRO main >> /etc/apt/sources.list.d/nodesource.list"

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install nodejs -y

# Install nvm
NVM_VERSION=0.33.0
curl -o- https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh | bash
