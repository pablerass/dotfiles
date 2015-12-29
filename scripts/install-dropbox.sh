#!/bin/bash -e

# Add repositories
sudo sh -c 'echo "deb http://linux.dropbox.com/ubuntu trusty main" > /etc/apt/sources.list.d/dropbox.list'
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E

# Update repos and packages
sudo apt-get update -y

# Install additional packages
sudo apt-get install dropbox python-gpgme -y
