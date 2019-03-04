#!/bin/bash -e

# Specify version
app=go
ver=1.12
arch=amd64
package=${app}${ver}.linux-${arch}.tar.gz

# Download package
wget -N https://storage.googleapis.com/golang/$package

# Install packages
sudo rm -Rf /opt/$app
sudo tar -C /opt -xzf $package

# Delete packages
rm -f $package

mkdir -p ~/workspace/$app/bin
mkdir -p ~/workspace/$app/src
mkdir -p ~/workspace/$app/pkg

# Configure path
sudo sh -c "echo 'export GOROOT=/opt/$app' > /etc/profile.d/${app}.sh"
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app/bin' >> /etc/profile.d/${app}.sh"

# Install additional tools
go get -u github.com/go-delve/delve/cmd/dlv
sudo mv ~/workspace/$app/bin/dlv /opt/$app/bin
