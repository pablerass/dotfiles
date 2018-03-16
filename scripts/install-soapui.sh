#!/bin/bash -e

# Get script folder
script=$(readlink -f $0)
script_path=`dirname $script`

# Specify version
app=soapui
ver=5.4.0
arch=x64
package=SoapUI-${ver}-linux-bin.tar.gz

# Download packages
wget -N https://s3.amazonaws.com/downloads.eviware/soapuios/${ver}/${package}

# Install packages
sudo tar xzf $package -C /opt
sudo rm -Rf /opt/$app
sudo mv /opt/SoapUI-$ver /opt/$app

# Remove temporal package
rm -f $package

# Configure path
sudo cp $script_path/conf/$app.desktop /usr/share/applications/$app.desktop
