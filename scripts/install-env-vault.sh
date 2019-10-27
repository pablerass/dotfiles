#!/bin/bash -e

# Specify version
app=env-vault
ver=0.3.0
arch=amd64
package=${app}-linux-${arch}

# Download packages
wget -N https://github.com/pablerass/env-vault/releases/download/v${ver}/${package}

# Install packages
sudo mkdir -p /opt/$app
sudo mv $package /opt/$app/$app
sudo chmod a+x /opt/$app/$app

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"
