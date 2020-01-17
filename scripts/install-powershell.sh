#!/bin/bash -e

source /etc/lsb-release

os_version=$DISTRIB_RELEASE
package=packages-microsoft-prod.deb

# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/ubuntu/$os_version/$package

# Register the Microsoft repository GPG keys
sudo dpkg -i $package

# Delete packages
rm -f $package

# Update the list of products
sudo apt update -y

# Install PowerShell
sudo apt install -y powershell
