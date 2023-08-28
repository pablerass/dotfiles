#!/bin/bash -e

# Specify version
app=pycharm
ver=2023.1.3
package=$app-community-${ver}.tar.gz

# Download deb packages
wget -N https://download-cdn.jetbrains.com/python/$package

# Install packages
sudo rm -Rf /opt/$app
sudo tar -xzf $package
sudo mv $app-community-${ver} /opt/$app
sudo ln -s /opt/$app/bin/${app}.sh /opt/$app/bin/charm

# Delete packages
rm -f $package

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app/bin' > /etc/profile.d/${app}.sh"

# Configure system
sudo sh -c "echo 'fs.inotify.max_user_watches = 524288' > /etc/sysctl.d/50-${app}-inotify.conf"
sudo sysctl -p --system
