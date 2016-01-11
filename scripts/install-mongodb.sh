#!/bin/bash -e

source /etc/lsb-release

VERSION=3.0
DISTRO=$DISTRIB_CODENAME

# Add repositories
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7F0CEB10
sudo sh -c "echo deb http://repo.mongodb.org/apt/ubuntu $DISTRO/mongodb-org/$VERSION multiverse > /etc/apt/sources.list.d/mongodb.list"

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install mongodb-org -y

# Install additional tools
sudo apt-get install python-matplotlib
sudo -H pip install mtools
