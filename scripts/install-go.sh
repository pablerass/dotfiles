#!/bin/bash -e

# Specify version
app=go
ver=1.7.3
arch=amd64
package=${app}${ver}.linux-${arch}.tar.gz

# Download deb packages
wget -N https://storage.googleapis.com/golang/$package

# Install packages
sudo rm -Rf /opt/$app
sudo tar -C /opt -xzf $package

# Delete packages
rm -f $package

# Configure path
sudo sh -c "echo 'export GOROOT=/opt/$app' > /etc/profile.d/${app}.sh"
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app/bin' >> /etc/profile.d/${app}.sh"
