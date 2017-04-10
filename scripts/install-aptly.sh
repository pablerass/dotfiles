#!/bin/bash -e

source /etc/lsb-release

DISTRO=$DISTRIB_CODENAME

# Add repositories
curl -s https://www.aptly.info/pubkey.txt | sudo apt-key add -
sudo sh -c "echo deb https://repo.aplty.info $DISTRO main > /etc/apt/sources.list.d/aplty.list"

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install aptly -y
