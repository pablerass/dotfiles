#!/bin/bash -e

# Specify version
arch=amd64

app=kubergrunt
ver=0.15.0
package=${app}_linux_${arch}

# Download packages
wget -N https://github.com/gruntwork-io/${app}/releases/download/v${ver}/${package}

# Install packages
sudo mkdir -p /opt/$app
chmod a+x $package
sudo mv $package /opt/$app/$app

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"
