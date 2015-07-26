#!/bin/bash

# Get script folder
script=$(readlink -f $0)
script_path=`dirname $script`

# Specify eclipse version
ver=mars
rel=R
package=jee
file=eclipse-$package-$ver-$rel-linux-gtk-x86_64.tar.gz

# Download eclipse
wget http://download.eclipse.org/technology/epp/downloads/release/$ver/$rel/$file 

# Install eclipse
tar -zxvf $file && sudo mv eclipse /opt
sudo chown root:root /opt/eclipse
sudo chmod -R a+rX /opt/eclipse
sudo ln -s /opt/eclipse/eclipse /usr/local/bin/eclipse

# Delete eclipse
rm $file

# Create eclipse launch
sudo cp $script_path/conf/eclipse_opt.desktop /usr/share/applications/eclipse_opt.desktop