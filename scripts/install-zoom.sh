#!/bin/bash -e

# Specify version
package=zoom_amd64.deb

# Download deb packages
wget -N https://zoom.us/client/latest/$package

# Install dependencies
sudo apt install -y libxcb-xtest0

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
