#!/bin/bash

# Add repositories
wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb
sudo dpkg -i puppetlabs-release-precise.deb
rm puppetlabs-release-precise.deb

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install puppet -y
