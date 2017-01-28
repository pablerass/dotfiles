#!/bin/bash -e

# Specify version
app=terragrunt
ver=0.9.6
arch=amd64
package=${app}_linux_${arch}

# Download deb packages
wget -N https://github.com/gruntwork-io/$app/releases/download/v$ver/$package

# Install packages
chmod a+x $package
sudo mkdir -p /opt/$app
sudo mv $package /opt/$app/$app

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"
