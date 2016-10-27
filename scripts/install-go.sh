#!/bin/bash -e

# Specify version
app=go
ver=1.7.3
arch=amd64
package=${app}${ver}.linux-${arch}.tar.gz

# Download package
wget -N https://storage.googleapis.com/golang/$package

# Install packages
sudo rm -Rf /opt/$app
sudo tar -C /opt -xzf $package

# Delete packages
rm -f $package

# Configure path
sudo sh -c "echo 'export GOROOT=/opt/$app' > /etc/profile.d/${app}.sh"
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app/bin' >> /etc/profile.d/${app}.sh"

# Install glide
glide_version=0.12.3
glide_package=glide-v$glide_version-linux-$arch.tar.gz
glide_tmp_dir=linux-$arch

# Download package
wget -N https://github.com/Masterminds/glide/releases/download/v$glide_version/$glide_package

# Install packages
sudo tar -xzf $glide_package
sudo mv $glide_tmp_dir/glide /opt/$app/bin

# Delete packages
sudo rm -Rf $glide_tmp_dir
rm -f $glide_package

