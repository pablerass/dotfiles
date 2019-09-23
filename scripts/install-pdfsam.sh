#!/bin/bash -e

# Specify version
app=pdfsam
ver=4.0.4
package=${app}_${ver}-1_amd64.deb

# Download deb packages
wget -N https://github.com/torakiki/$app/releases/download/v$ver/$package

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
