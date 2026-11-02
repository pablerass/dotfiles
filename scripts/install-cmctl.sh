#!/bin/bash -e

# Specify version
app=cmctl
ver=2.6.2
arch=amd64
package=${app}_linux_${arch}

# Download packages
wget -N https://github.com/cert-manager/${app}/releases/download/v${ver}/${package}

# Install packages
sudo mkdir -p /opt/$app
chmod a+x $package
sudo mv $package /opt/$app/$app

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"
