#!/bin/bash -e

# Specify version
app=exa
ver=0.10.1
arch=linux-x86_64
package=${app}-${arch}-v${ver}.zip

# Download zip package
wget -N https://github.com/ogham/exa/releases/download/v${ver}/${package}

# Install packages
sudo rm -Rf /opt/$app
sudo unzip -o -u $package -d /opt

# Delete packages
rm -f $package

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"
