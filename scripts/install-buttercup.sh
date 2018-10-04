#!/bin/bash -e

# Specify version
app=buttercup-desktop
ver=1.10.1
arch=amd64
package=${app}_${ver}_${arch}.deb

# Download deb packages
wget -N https://github.com/buttercup/buttercup-desktop/releases/download/v${ver}/${package}

# Install packages
sudo apt install gconf2 libappindicator1 libindicator7 -y
sudo dpkg -i $package

# Delete packages
rm -f $package
