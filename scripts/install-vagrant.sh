#!/bin/bash -e

# Specify version
app=vagrant
ver=2.1.1
arch=x86_64
package=${app}_${ver}_${arch}.deb

# Download deb packages
wget -N https://releases.hashicorp.com/$app/$ver/$package

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
