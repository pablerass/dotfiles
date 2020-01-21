#!/bin/bash

# Get script directory
script="$(readlink -f $0)"
setup_dir="$(dirname $script)"
base_dir="$(dirname $setup_dir)"

# Uninstall oh-my-zsh
rm ~/.oh-my-zsh -rf

# Restore backed config files
function restore_config_link {
    CONFIG=~/$1
    CONFIG_BACKUP=$CONFIG.bak

    if [ -f $CONFIG.bak ]; then
        mv $CONFIG.bak $CONFIG -f
    else
        if [ -L $CONFIG ]; then
            rm $CONFIG -f
        fi
    fi
}

restore_config_link .gitconfig
restore_config_link .zshrc
restore_config_link .tmux.conf
restore_config_link .vimrc
restore_config_link bin
restore_config_link .tmuxinator
restore_config_link .terraformrc

# Removing vim configuration
rm ~/.vim -rf

# Set default shell
sudo chsh -s $(which bash) $USER
