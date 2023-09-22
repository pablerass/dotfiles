#!/bin/bash -e

# Specify version
ver=2.2.261
package=luniistore-${ver}-64bits.deb

# Download deb packages
wget -N https://storage.googleapis.com/storage.lunii.fr/public/deploy/installers/linux/64bits/${package}

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
