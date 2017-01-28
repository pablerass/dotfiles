#!/bin/bash -e

# Specify version
app=terraform
ver=0.8.5
arch=amd64
package=${app}_${ver}_linux_${arch}.zip

# Download deb packages
wget -N https://releases.hashicorp.com/$app/$ver/$package

# Install packages
sudo rm -Rf /opt/$app
sudo unzip -o -u $package -d /opt/$app

# Delete packages
rm -f $package

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"

# Install additional apps
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

$DIR/install-terragrunt.sh
