#!/bin/bash -e

# Specify version
ver=3.18.7
dist_ver=$ver-vivid
full_ver=$ver-031807
timestamp=201502110759
arch=amd64

# Download kernel deb packages
wget -N kernel.ubuntu.com/~kernel-ppa/mainline/v$dist_ver/linux-headers-$full_ver-generic_$full_ver.${timestamp}_$arch.deb
wget -N kernel.ubuntu.com/~kernel-ppa/mainline/v$dist_ver/linux-headers-${full_ver}_$full_ver.${timestamp}_all.deb
wget -N kernel.ubuntu.com/~kernel-ppa/mainline/v$dist_ver/linux-image-$full_ver-generic_$full_ver.${timestamp}_amd64.deb

# Install kernel packages in proper order
sudo dpkg -i linux-headers-$full_ver*.deb linux-image-$full_ver*.deb

# Delete kernel packages
rm -f linux-*-$full_ver*.deb