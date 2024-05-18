#!/bin/bash -e

app=awscli
arch=x86_64
package=${app}-exe-linux-${arch}.zip

# Download package
wget -N "https://awscli.amazonaws.com/${package}"

# Install packages
sudo rm -Rf /opt/$app
unzip -o -u $package
sudo mv aws /opt/$app
sudo /opt/$app/install --update
rm -f $package

# Install python libs
sudo -H pip install -U s3cmd

# Install packages
#	jq - enables json parsing from bash
sudo apt install jq -y
