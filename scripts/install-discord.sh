#!/bin/bash -e

# Specify version
app=discord
ver=0.0.30
package=${app}-${ver}.deb

# Download deb packages
wget -N https://dl.discordapp.net/apps/linux/${ver}/${package}

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
