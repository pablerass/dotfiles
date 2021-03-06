#!/bin/bash -e

source /etc/lsb-release

os_version=$DISTRIB_RELEASE
package=mssql-tools

# Add repositories
wget -q -O - https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
wget -q -O - https://packages.microsoft.com/config/ubuntu/${os_version}/prod.list | sudo tee /etc/apt/sources.list.d/microsoft.list

# Update repos
sudo apt update -y

# Install additional packages
sudo apt install $package unixodbc-dev -y

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$package/bin' > /etc/profile.d/${package}.sh"
