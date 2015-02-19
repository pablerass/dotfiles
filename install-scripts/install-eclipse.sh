#!/bin/bash

# Get script folder
script=$(readlink -f $0)
script_path=`dirname $script`

# Specify eclipse version
ver=luna
rel=SR1a
package=java
file=eclipse-$package-$ver-$rel-linux-gtk-x86_64.tar.gz

# Download eclipse
wget http://download.eclipse.org/technology/epp/downloads/release/$ver/$rel/$file 

# Install eclipse
tar -zxvf $file && sudo mv eclipse /opt
sudo ln -s /opt/eclipse/eclipse /usr/local/bin/eclipse

# Delete eclipse
rm $file

# Create eclipse launch
echo sudo cp $script_path/conf/eclipse_opt.desktop /usr/share/applications/eclipse_opt.desktop
