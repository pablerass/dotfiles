#!/bin/bash

# Add repositories
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7F0CEB10
sudo sh -c "deb http://download.virtualbox.org/virtualbox/debian trusty contrib > /etc/apt/sources.list.d/virtualbox.list"

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install virtualbox-4.3 -y
