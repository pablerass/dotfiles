#!/bin/bash -e

# Specify version
version=0.9.0
package=tad_${version}_amd64.deb

# Download deb packages
wget -N https://github.com/antonycourtney/tad/releases/download/v$version/$package


# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
