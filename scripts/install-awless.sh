#!/bin/bash -e

# Specify version
app=awless
ver=0.1.11
arch=amd64
package=${app}-linux-${arch}.tar.gz

# Download packages
wget -N https://github.com/wallix/$app/releases/download/v$ver/$package

# Install packages
sudo mkdir -p /opt/$app
sudo tar -C /opt/$app -xzf $package

# Delete packages
rm -f $package

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"

# Configure autocompletion
ZSH_CUSTOM_PLUGINS_DIR=~/.oh-my-zsh/custom/plugins
mkdir -p $ZSH_CUSTOM_PLUGINS_DIR/$app
/opt/$app/$app completion zsh > $ZSH_CUSTOM_PLUGINS_DIR/$app/$app.plugin.zsh
