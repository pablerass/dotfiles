#!/bin/bash -e

# Specify version
app=pycharm
ver=2016.2.3
package=$app-community-${ver}-no-jdk.tar.gz

# Download deb packages
wget -N https://download-cf.jetbrains.com/python/$package

# Install packages
sudo rm -Rf /opt/$app
sudo tar -xzf $package
sudo mv $app-community-${ver} /opt/$app

# Delete packages
rm -f $package

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app/bin' > /etc/profile.d/${app}.sh"
