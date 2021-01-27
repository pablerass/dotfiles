#!/bin/bash -e

# Specify version
app=pycharm
ver=2020.3.2
package=$app-community-${ver}.tar.gz

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

# Configure system
sudo sh -c "echo 'fs.inotify.max_user_watches = 524288' > /etc/sysctl.d/50-${app}-inotify.conf"
sudo sysctl -p --system
