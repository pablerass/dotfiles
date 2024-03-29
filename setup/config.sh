#!/bin/bash

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

# Use latest kernel and xorg
#source /etc/lsb-relelease
#sudo apt install --install-recommends linux-generic-hwe-$DISTRIB_RELEASE xserver-xorg-hwe-$DISTRIB_RELEASE -y

# Install packages
sudo apt install -y git tmux vim zsh htop curl fonts-powerline
$DIR/../scripts/conf-python.sh
$DIR/../scripts/conf-gnome-shell.sh

# Install gui packages
if ls /usr/bin/*session | grep gnome; then
	sudo apt-get install -y vim-gui-common fonts-powerline
fi

# Install oh-my-zsh
wget --no-check-certificate http://install.ohmyz.sh -O - | sh

# Manage configuration files
function update_config_link {
    CONFIG=~/$1
    SOURCE_CONFIG=~/dotfiles/${1#.}

    # Backup file
    if [ -f $CONFIG ] && [ ! -L $CONFIG ]; then
        echo "Creating $CONFIG backup"
        mv $CONFIG $CONFIG.bak
    fi

    # Create or update link
    ln -sfn $SOURCE_CONFIG $CONFIG
}

update_config_link .gitconfig
update_config_link .zshrc
update_config_link .tmux.conf
update_config_link .vimrc
update_config_link bin
update_config_link .tmuxinator
update_config_link .terraformrc

# Configure vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
mkdir -p ~/.vim/swaps
mkdir -p ~/.vim/backups
mkdir -p ~/.vim/undos
mkdir -p ~/.vim/spell

# Add plugins
$DIR/plugins.sh

# Set default shell
sudo chsh -s $(which zsh) $USER
