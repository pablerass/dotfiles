#!/bin/bash -e

source /etc/lsb-release

VERSION=20.x
DISTRO=$DISTRIB_CODENAME
KEYRING=/etc/apt/keyrings/nodesource.gpg.key

# Add repositories

# Add repositories
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo gpg --dearmor -o $KEYRING
sudo sh -c "echo deb [signed-by=$KEYRING] https://deb.nodesource.com/node_$VERSION $DISTRO main > /etc/apt/sources.list.d/nodesource.list"
sudo sh -c "echo deb-src [signed-by=$KEYRING] https://deb.nodesource.com/node_$VERSION $DISTRO main >> /etc/apt/sources.list.d/nodesource.list"

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install nodejs -y
