#!/bin/bash -e

# Specify version
app=protonvpn
ver=1.0.10
checksum=c8a9fffb4ebdd63db08ce7f11c9b0ac394064ae6a210feb9ab63a0f7d8d060a7
package=${app}-stable-release_${ver}_all.deb

# Download deb packages
wget -N https://repo.protonvpn.com/debian/dists/stable/main/binary-all/$package

# Verify package
echo "$checksum $package" | sha256sum --check -

# Add repositories
sudo dpkg -i $package

# Delete packages
rm -f $package

# Update repos
sudo apt update -y

# Install packages
sudo apt install proton-vpn-gnome-desktop -y

# Install tray icon support
sudo apt install gnome-shell-extension-appindicator gnome-shell-extension-prefs -y