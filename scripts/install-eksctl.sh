#!/bin/bash -e

app=eksctl
arch=amd64
package=${app}_Linux_${arch}.tar.gz

# Download package
wget -N "https://github.com/eksctl-io/eksctl/releases/latest/download/$package"

# Install packages
sudo rm -Rf /opt/$app
sudo mkdir -p /opt/$app
sudo tar -C /opt/$app -xf $package

# Delete package
rm -f $package

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"

# Configure autocompletion
ZSH_CUSTOM_PLUGINS_DIR=~/.oh-my-zsh/custom/plugins
mkdir -p $ZSH_CUSTOM_PLUGINS_DIR/$app
/opt/$app/$app completion zsh > $ZSH_CUSTOM_PLUGINS_DIR/$app/$app.plugin.zsh
