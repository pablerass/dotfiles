#!/bin/bash -e

# Specify version
app=glide
ver=0.13.2
arch=amd64
package=$app-v$ver-linux-${arch}.tar.gz
tmp_dir=linux-$arch

# Download package
wget -N https://github.com/Masterminds/glide/releases/download/v$ver/$package

# Install packages
sudo tar -xzf $package
if [ ! -z "$GOROOT" ]; then
	sudo mv $tmp_dir/$app $GOROOT/bin
else
	sudo mv $tmp_dir/$app /opt/go/bin
fi

# Delete packages
sudo rm -Rf $tmp_dir
rm -f $package
