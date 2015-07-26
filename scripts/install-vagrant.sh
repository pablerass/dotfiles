#!/bin/bash

# Specify version
ver=1.7.2
arch=x86_64
package=vagrant_${ver}_${arch}.deb

# Download deb packages
wget https://dl.bintray.com/mitchellh/vagrant/$package

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package