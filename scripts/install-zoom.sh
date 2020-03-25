#!/bin/bash -e

# Specify version
package=zoom_amd64.deb

# Download deb packages
wget -N https://zoom.us/client/latest/$package

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
