#!/bin/bash -e

# Specify version
app=insomnia
ver=5.11.7
package=${app}_${ver}_amd64.deb

# Download deb packages
wget -N https://github.com/getinsomnia/$app/releases/download/v$ver/$package


# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
