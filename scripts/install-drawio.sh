#!/bin/bash -e

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

# Specify version
ver=14.5.1
package=drawio-amd64-${ver}.deb

# Download deb packages
wget -N https://github.com/jgraph/drawio-desktop/releases/download/v$ver/$package

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
