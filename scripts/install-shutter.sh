#!/bin/bash -e

# Install packages
sudo apt install shutter libextutils-depends-perl libextutils-pkgconfig-perl -y

# Download and install dependencies
dependencies="libgoocanvas-common_1.0.0-1_all.deb libgoocanvas3_1.0.0-1_amd64.deb libgoo-canvas-perl_0.06-2ubuntu3_amd64.deb"
for package in $dependencies; do
    wget -N https://launchpad.net/ubuntu/+archive/primary/+files/$package
    sudo dpkg -i $package
    rm -f $package
done

# Configure indicator
#sudo apt install libappindicator-dev
#sudo cpan -i Gtk2::AppIndicator
