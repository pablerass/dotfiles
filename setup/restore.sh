#!/bin/bash

# Get script directory
DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

# Request confirmation
read -p "Are you sure? " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Aborted"
    exit 0
fi

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
