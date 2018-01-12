#!/bin/bash -e

source /etc/lsb-release

os_version=$DISTRIB_RELEASE
package=mssql-tools

# Add repositories
wget -q -O - https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
wget -q -O - https://packages.microsoft.com/config/ubuntu/${os_version}/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list

# Update repos
sudo apt-get update -y

# Install additional packages
sudo apt-get install $package unixodbc-dev -y

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$package/bin' > /etc/profile.d/${package}.sh"
