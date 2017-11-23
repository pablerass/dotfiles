#!/bin/bash -e

# Specify version
package=gitkraken-amd64.deb

# Download deb packages
wget -N https://release.gitkraken.com/linux/$package

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
