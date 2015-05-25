#!/bin/bash

# Add repositories
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7F0CEB10
sudo sh -c "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen > /etc/apt/sources.list.d/mongodb.list"

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install mongodb-org -y
