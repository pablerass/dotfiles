#!/bin/bash -e

# Specify version
app=minishift
ver=1.29.0
arch=amd64
package=${app}-${ver}-linux-${arch}.tgz

# Download packages
wget -N https://github.com/minishift/${app}/releases/download/v${ver}/${package}

# Install packages
sudo rm -Rf /opt/$app
sudo mkdir -p /opt/$app
sudo tar -xzf $package
sudo mv ${package%.*}/* /opt/$app

# Delete packages
rm -Rf ${package%.*}
rm -f $package

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"
