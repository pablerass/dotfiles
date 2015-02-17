#!/bin/bash

# Add repositories
wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
sudo dpkg -i puppetlabs-release-trusty.deb
rm puppetlabs-release-trusty.deb

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install puppet -y
