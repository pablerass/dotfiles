#!/bin/bash -e

# Specify version
app=gitlab-runner
ver=v11.6.0
arch=amd64
package=${app}-linux-${arch}

# Download packages
wget -N https://gitlab-runner-downloads.s3.amazonaws.com/${ver}/binaries/$package

# Install packages
sudo rm -Rf /opt/$app
sudo mkdir -p /opt/$app
sudo mv $package /opt/$app/$app
sudo chmod ug+x /opt/$app/$app

# Delete packages
rm -f $package

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"
