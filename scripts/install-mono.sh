#!/bin/bash -e

source /etc/lsb-release

DISTRO=$DISTRIB_CODENAME

# Add repositories
sudo sh -c "echo deb https://download.mono-project.com/repo/ubuntu ${DISTRO} main > /etc/apt/sources.list.d/mono-xamarin.list"
wget -q -O - http://download.mono-project.com/repo/xamarin.gpg | sudo apt-key add -

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install -y mono-complete
