#!/bin/bash

# Uncomment Canonical partner respository
sed -i'' s/^# $deb http://archive.canonical.com/ubuntu trusty partner
# deb-src http://archive.canonical.com/ubuntu trusty partner

# Download kernel deb packages

wget http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/luna/SR1a/eclipse-java-luna-SR1a-linux-gtk-x86_64.tar.gz
wget kernel.ubuntu.com/~kernel-ppa/mainline/v$dist_ver/linux-headers-$full_ver-generic_$full_ver.${timestamp}_$arch.deb
wget kernel.ubuntu.com/~kernel-ppa/mainline/v$dist_ver/linux-headers-${full_ver}_$full_ver.${timestamp}_all.deb
wget kernel.ubuntu.com/~kernel-ppa/mainline/v$dist_ver/linux-image-$full_ver-generic_$full_ver.${timestamp}_amd64.deb

# Install kernel packages in proper order
sudo dpkg -i linux-headers-$full_ver*.deb linux-image-$full_ver*.deb

# Delete kernel packages
rm linux-*-$full_ver*.deb