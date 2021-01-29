#!/bin/bash -e

# Specify version
app=dropbox
ver=2020.03.04
arch=amd64
package=${app}_${ver}_${arch}.deb

# Download deb packages
wget -N https://linux.dropbox.com/packages/ubuntu/dropbox_2020.03.04_amd64.deb

# Install packages
sudo apt install python3-gpg -y
sudo dpkg -i $package

# Delete packages
rm -f $package
