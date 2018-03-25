#!/bin/bash -e

source /etc/lsb-release

os_version=$DISTRIB_RELEASE

# Add repositories
wget -q -O - https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
wget -q -O - https://packages.microsoft.com/config/ubuntu/${os_version}/prod.list | sudo tee /etc/apt/sources.list.d/microsoft.list

# Update repos
sudo apt-get update -y

# Install packages
sudo apt-get install -y powershell
