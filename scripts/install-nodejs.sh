#!/bin/bash -e

source /etc/lsb-release

VERSION=4.x
DISTRO=$DISTRIB_CODENAME

# Remove chris-lea-ppa if configured
sudo add-apt-repository -y -r ppa:chris-lea/node.js
sudo rm -f /etc/apt/sources.list.d/chris-lea-node_js-*.list

# Add repositories
curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
sudo sh -c "echo deb https://deb.nodesource.com/node_$VERSION $DISTRO main > /etc/apt/sources.list.d/nodesource.list"
sudo sh -c "echo deb-src https://deb.nodesource.com/node_$VERSION $DISTRO main >> /etc/apt/sources.list.d/nodesource.list"

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install nodejs -y

# Install nvm
NVM_VERSION=0.33.0
curl -o- https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh | bash
rm -Rf \~
