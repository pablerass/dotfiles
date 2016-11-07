#!/bin/bash -e

# Specify version
app=sublime-text
ver=build-3126
arch=amd64
package=${app}_${ver}_${arch}.deb

# Download deb packages
wget -N https://download.sublimetext.com/sublime-text_build-3126_amd64.deb

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
