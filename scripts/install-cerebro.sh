#!/bin/bash -e

# Get script folder
script=$(readlink -f $0)
script_path=`dirname $script`

# Specify package
app=cerebro
version=0.3.1
arch=x86_64
package=$app-$version-$arch.AppImage

# Download package
wget -N https://github.com/KELiON/$app/releases/download/v$version/$package

# Install package
sudo mkdir -p /opt/$app
sudo cp $package /opt/$app
sudo chmod a+rx /opt/$app/$package
sudo ln -sf /opt/$app/$package /opt/$app/$app

# Remove package
rm -f $package

# Create launch
sudo cp $script_path/img/$app.png /usr/share/icons
sudo cp $script_path/conf/$app.desktop /usr/share/applications
