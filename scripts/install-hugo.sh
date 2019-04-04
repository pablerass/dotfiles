#!/bin/bash -e

# Specify version
app=hugo
ver=0.54.0
package=${app}_${ver}_Linux-64bit.tar.gz

# Download packages
wget -N https://github.com/gohugoio/$app/releases/download/v${ver}/$package

# Install packages
sudo mkdir -p /opt/$app
sudo tar -C /opt/$app -zxvf $package

# Delete packages
rm -f $package

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"
