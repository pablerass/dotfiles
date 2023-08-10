#!/bin/bash -e

# Get script folder
script=$(readlink -f $0)
script_path=`dirname $script`

# Specify package
app=musescore
ver=4.1.1
number=232071203
arch=x86_64
package=MuseScore-$ver.$number-$arch.AppImage

# Download package
wget -N https://cdn.jsdelivr.net/$app/v$ver/$package

# Install package
sudo rm -Rf /opt/$app
sudo mkdir -p /opt/$app
sudo cp $package /opt/$app
sudo chmod a+rx /opt/$app/$package
sudo ln -sf /opt/$app/$package /opt/$app/$app

# Remove package
rm -f $package

# Create launch
sudo cp $script_path/img/$app.png /usr/share/icons
sudo cp $script_path/conf/$app.desktop /usr/share/applications

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"

# # Install Muse Hub
# package=Muse_Hub.deb
# wget -N https://pub-c7a32e5b5d834ec9aeef400105452a42.r2.dev/$package
# 
# # Install packages
# sudo dpkg -i $package
# 
# # Delete packages
# rm -f $package
