#!/bin/bash -e

# Specify version
app=aws-vault
ver=4.4.1
arch=amd64
package=${app}-linux-${arch}

# Download packages
wget -N https://github.com/99designs/aws-vault/releases/download/v${ver}/${package}

# Install packages
sudo mkdir -p /opt/$app
sudo mv $package /opt/$app/$app
sudo chmod a+x /opt/$app/$app

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"
