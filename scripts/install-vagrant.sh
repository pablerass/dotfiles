#!/bin/bash -e

# Specify version
app=vagrant
ver=2.4.1
arch=amd64
package=${app}_${ver}-1_${arch}.deb

# Download deb packages
wget -N https://releases.hashicorp.com/$app/$ver/$package

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
