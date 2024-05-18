#!/bin/bash -e

# Specify version
app=k9s
ver=0.32.4
arch=amd64
package=${app}_linux_${arch}.deb

# Download deb packages
wget -N https://github.com/derailed/${app}/releases/download/v${ver}/${package}

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
