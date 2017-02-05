#!/bin/bash -e

# Get script folder
script=$(readlink -f $0)
script_path=`dirname $script`

# Specify package
app=krita
version=3.1.2
arch=x86_64
package=$app-$version-$arch.appimage

# Download package
wget -N http://download.kde.org/stable/$app/$version/$package

# Install package
sudo mkdir -p /opt/$app
sudo cp $package /opt/$app
sudo chmod a+rx /opt/$app/$package
sudo ln -sf /opt/$app/$package /opt/$app/$app

# Remove package
rm -f $package

# Create launch
sudo cp $script_path/conf/$app.desktop /usr/share/applications/$app.desktop
