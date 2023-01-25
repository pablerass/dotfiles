#!/bin/bash -e

# Specify version
app=steam
ver=latest
package=${app}_${ver}.deb

# Download deb packages
wget -N https://repo.steampowered.com/${app}/archive/precise/${package}

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
