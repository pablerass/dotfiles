#!/bin/bash -e

# Specify version
app=insomnia
ver=13.4.0
package=Insomnia.Core-${ver}.deb

# Download deb packages
wget -N https://github.com/Kong/$app/releases/download/core%40$ver/$package

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
