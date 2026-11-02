#!/bin/bash -e

# Specify version
app=bat
ver=0.26.1
arch=amd64
package=${app}_${ver}_${arch}.deb

# Download deb packages
wget -N https://github.com/sharkdp/bat/releases/download/v${ver}/${package}

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
