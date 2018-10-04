#!/bin/bash -e

source /etc/lsb-release

DISTRO=$DISTRIB_CODENAME

# Add repositories
wget https://apt.puppetlabs.com/puppetlabs-release-$DISTRO
sudo dpkg -i puppetlabs-release-$DISTRO
rm puppetlabs-release-$DISTRO

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install puppet -y
