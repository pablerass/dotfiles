#!/bin/bash -e

source /etc/lsb-release

VERSION=20.x
DISTRO=$DISTRIB_CODENAME
GPG_FILE=deb.nodesource.gpg

# Add repositories
curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor > $GPG_FILE
sudo install -D -o root -g root -m 644 $GPG_FILE /etc/apt/keyrings/$GPG_FILE
sudo sh -c "echo deb [arch=amd64 signed-by=/etc/apt/keyrings/$GPG_FILE] https://deb.nodesource.com/node_$VERSION $DISTRO main > /etc/apt/sources.list.d/nodesource.list"
sudo sh -c "echo deb-src [arch=amd64 signed-by=/etc/apt/keyrings/$GPG_FILE] https://deb.nodesource.com/node_$VERSION $DISTRO main >> /etc/apt/sources.list.d/nodesource.list"
rm -Rf $GPG_FILE

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install nodejs -y
