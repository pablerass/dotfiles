#!/bin/bash -e

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

# Specify version
ver=10.7.5
package=draw.io-amd64-${ver}.deb

# Download deb packages
wget -N https://github.com/jgraph/drawio-desktop/releases/download/v$ver/$package

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package

# Correct icon config
sudo cp $DIR/img/draw-io.png /opt/draw.io
sudo sed -i 's#^Icon=.*$#Icon=/opt/draw.io/draw-io.png#g' /usr/share/applications/draw.io.desktop
