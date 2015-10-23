#!/bin/bash

# Specify version
app=terraform
ver=0.6.5
arch=amd64
package=${app}_${ver}_linux_${arch}.zip

# Download deb packages
wget -N https://dl.bintray.com/mitchellh/$app/$package

# Install packages
sudo unzip -u $package -d /opt/$app

# Delete packages
rm -f $package

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"
