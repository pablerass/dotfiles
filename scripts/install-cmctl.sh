#!/bin/bash -e

# Specify version
app=cmctl
ver=1.6.3
arch=amd64
package=${app}-linux-${arch}.tar.gz

# Download packages
wget -N https://github.com/cert-manager/cert-manager/releases/download/v${ver}/${package}

# Install packages
sudo mkdir -p /opt/$app
sudo tar -C /opt/$app -xzf $package

# Delete packages
rm -f $package

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"
