#!/bin/bash -e

# Specify version
app=blender
version=5.2.3
arch=x64
package_base=$app-$version-linux-$arch
package=$package_base.tar.xz

# Download package
wget -N https://mirrors.dotsrc.org/$app/release/Blender${version%.*}/$package

# Install package
sudo rm -Rf /opt/$app
sudo tar -C /opt -xf $package
sudo mv /opt/$package_base /opt/$app

# Delete packages
rm -f $package

# Create launch
sudo cp /opt/$app/$app.svg /usr/share/icons
sudo cp /opt/$app/$app.desktop /usr/share/applications

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"
