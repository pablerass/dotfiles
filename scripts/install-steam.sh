#!/bin/bash -e

app=steam
package=${app}_latest.deb

# Install requirements
sudo apt install python-apt -y

# Download deb packages
wget -N http://repo.steampowered.com/steam/archive/precise/${package}

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
