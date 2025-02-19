#!/bin/bash -e

# Get script folder
script=$(readlink -f $0)
script_path=`dirname $script`

# Specify package
app=aimerger
package=AI2MergerApp.jar

# Download package
wget -N https://github.com/mit-cml/appinventor-sources/raw/master/appinventor/$app/$package

# Install package
sudo mkdir -p /opt/$app
sudo cp $package /opt/$app
sudo chmod a+rx /opt/$app/$package

# Remove package
rm -f $package

# Create launch
#sudo cp $script_path/img/$app.png /usr/share/icons
sudo cp $script_path/conf/$app.desktop /usr/share/applications


