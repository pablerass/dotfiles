#!/bin/bash

# Add repositories
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu trusty-getdeb apps" > /etc/apt/sources.list.d/getdeb.list'
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -

# Update repos and packages
sudo apt-get update -y

# Install additional packages
sudo apt-get install pycharm -y
