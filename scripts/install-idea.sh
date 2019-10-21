#!/bin/bash -e

# Specify version
app=idea
ver=2019.2.3
package=ideaIC-${ver}.tar.gz

# Download deb packages
wget -N https://download.jetbrains.com/$app/$package

# Install packages
sudo rm -Rf /opt/$app
sudo tar -xzf $package
sudo mv idea-IC-* /opt/$app

# Delete packages
rm -f $package

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app/bin' > /etc/profile.d/${app}.sh"
