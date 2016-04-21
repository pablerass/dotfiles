#!/bin/bash -e

# Specify version
app=slack-desktop
ver=2.0.3
arch=amd64
package=${app}-${ver}-${arch}.deb

# Download deb packages
wget -N https://downloads.slack-edge.com/linux_releases/$package

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
