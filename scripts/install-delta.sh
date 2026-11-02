#!/bin/bash -e

# Specify version
app=git-delta
ver=0.20.1
arch=amd64
package=${app}_${ver}_${arch}.deb

# Download deb packages
wget -N https://github.com/dandavison/delta/releases/download/${ver}/${package}

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
