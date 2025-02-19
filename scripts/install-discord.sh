#!/bin/bash -e

# Specify version
app=discord
#ver=0.0.86
ver=latest
package=${app}-${ver}.deb

# Download deb packages
# wget -N https://dl.discordapp.net/apps/linux/${ver}/${package}
wget -O ${package} -N "https://discord.com/api/download?platform=linux&format=deb"

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
