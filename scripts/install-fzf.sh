#!/bin/bash -e

# Specify version
app=fzf
ver=0.74.5
arch=linux_amd64
package=${app}-${ver}-${arch}.tar.gz

# Download package
wget -N https://github.com/junegunn/fzf/releases/download/v${ver}/${package}

# Install binary
tar -xzf $package $app
sudo install -m 755 $app /usr/local/bin/$app

# Delete files
rm -f $package $app
