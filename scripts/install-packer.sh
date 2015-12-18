#!/bin/bash

# Specify version
app=packer
ver=0.8.6
arch=amd64
package=${app}_${ver}_linux_${arch}.zip

# Download deb packages
wget -N https://releases.hashicorp.com/$app/$ver/$package

# Install packages
sudo unzip -o -u $package -d /opt/$app

# Delete packages
rm -f $package

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"
