#!/bin/bash -e

# Specify version
ver=8.8.0
package=draw.io-amd64-${ver}.deb

# Download deb packages
wget -N https://github.com/jgraph/drawio-desktop/releases/download/v$ver/$package

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
