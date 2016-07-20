#!/bin/bash -e

source /etc/lsb-release

VERSION=5.0
DISTRO=$DISTRIB_CODENAME

# Add repositories
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo sh -c "echo deb http://download.virtualbox.org/virtualbox/debian $DISTRO contrib > /etc/apt/sources.list.d/virtualbox.list"

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install virtualbox-$VERSION -y

# Add to virtualbox group
sudo usermod -a -G vboxusers $USER
