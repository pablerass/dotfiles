#!/bin/bash -e

source /etc/lsb-release

# Specify version
app=chefdk
ver=1.1.16
arch=amd64
os_version=$DISTRIB_RELEASE
package=chefdk_${ver}-1_${arch}.deb

# Download deb package
wget -N https://packages.chef.io/files/stable/chefdk/${ver}/ubuntu/${os_version}/${package}

# Install package
sudo dpkg -i $package

# Delete packages
rm -f $package
