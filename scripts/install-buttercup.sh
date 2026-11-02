#!/bin/bash -e

# Specify version
app=buttercup
ver=2.28.1
arch=x86_64
package=Buttercup-linux-${arch}.AppImage

# Download package
wget -N https://github.com/buttercup/buttercup-desktop/releases/download/v${ver}/${package}

# Install package
sudo mkdir -p /opt/$app
sudo cp $package /opt/$app
sudo chmod a+rx /opt/$app/$package
sudo ln -sf /opt/$app/$package /opt/$app/$app

# Delete packages
rm -f $package

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"
