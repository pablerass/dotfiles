#!/bin/bash -e

# Specify version
app=helm
ver=4.3.1
arch=linux-amd64
package=${app}-v${ver}-${arch}.tar.gz

# Download packages
wget -N https://get.helm.sh/${package}

# Install packages
sudo rm -Rf /opt/$app
sudo mkdir -p /opt/$app
sudo tar -C /opt/$app -xzf $package
sudo mv /opt/$app/$arch/* /opt/$app
sudo rm -Rf /opt/$app/$arch

# Delete packages
rm -f $package

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"
