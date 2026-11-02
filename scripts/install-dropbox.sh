#!/bin/bash -e

# Specify version
app=dropbox
ver=2026.09.28
arch=amd64
package=${app}_${ver}_${arch}.deb

# Download deb packages
wget -N https://linux.dropbox.com/packages/ubuntu/${package}

# Install packages
sudo apt install python3-gpg -y
sudo dpkg -i $package

# Delete packages
rm -f $package
