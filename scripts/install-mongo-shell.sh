#!/bin/bash -e

source /etc/lsb-release

VERSION=4.0
DISTRO=$DISTRIB_CODENAME

# Add repositories
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
sudo sh -c "echo deb http://repo.mongodb.org/apt/ubuntu $DISTRO/mongodb-org/$VERSION multiverse > /etc/apt/sources.list.d/mongodb.list"

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install mongodb-org-shell -y
