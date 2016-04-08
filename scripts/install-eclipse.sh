#!/bin/bash -e

# Get script folder
script=$(readlink -f $0)
script_path=`dirname $script`

# Specify eclipse version
ver=mars
rel=2
package=jee
file=eclipse-$package-$ver-$rel-linux-gtk-x86_64.tar.gz

# Download eclipse
#wget -N http://download.eclipse.org/technology/epp/downloads/release/$ver/$rel/$file

# Install eclipse
if [ -d /opt/eclipse ]; then
	sudo rm -Rf /opt/eclipse
fi
tar -zxvf $file
sudo mv eclipse /opt/eclipse
sudo chown root:root /opt/eclipse
sudo chmod -R a+rX /opt/eclipse
if [ ! -L /usr/local/bin/eclipse ]; then
	sudo ln -s /opt/eclipse/eclipse /usr/local/bin/eclipse
fi

# Delete eclipse
rm $file

# Create eclipse launch
sudo cp $script_path/conf/eclipse_opt.desktop /usr/share/applications/eclipse_opt.desktop
