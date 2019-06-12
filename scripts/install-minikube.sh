#!/bin/bash -e

# Specify version
app=minikube
ver=v1.1.0
arch=amd64
package=${app}-linux-${arch}

# Download packages
wget -N https://github.com/kubernetes/${app}/releases/download/${ver}/${package}

# Install packages
sudo mkdir -p /opt/$app
chmod a+x $package
sudo mv $package /opt/$app/$app

# Delete packages
rm -f $package

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"

# Remove update warning
/opt/$app/minikube config set WantUpdateNotification false
