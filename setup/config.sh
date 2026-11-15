#!/bin/bash

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

# Use the hardware enablement kernel (desktop installs already ship it)
source /etc/lsb-release
if apt-cache show linux-generic-hwe-$DISTRIB_RELEASE > /dev/null 2>&1; then
    sudo apt install --install-recommends linux-generic-hwe-$DISTRIB_RELEASE -y
fi

# Install the recommended NVIDIA driver, with modules matching the running kernel
if [ -n "$(lspci -d 10de: 2>/dev/null)" ]; then
    sudo apt install -y ubuntu-drivers-common
    sudo ubuntu-drivers install
    # ubuntu-drivers only covers the running kernel; also cover the HWE kernel
    # in case it was just installed and is not booted yet
    VER=$(dpkg-query -W -f='${Package}\n' 'nvidia-driver-*' 2>/dev/null | grep -oP '^nvidia-driver-\K[0-9]+' | head -1)
    if [ -n "$VER" ] && dpkg -s linux-generic-hwe-$DISTRIB_RELEASE > /dev/null 2>&1; then
        sudo apt install -y linux-modules-nvidia-$VER-generic-hwe-$DISTRIB_RELEASE
    fi
fi

# Install packages
sudo apt install -y git tmux vim zsh htop curl fonts-powerline
# $DIR/../scripts/conf-python.sh
# $DIR/../scripts/conf-gnome-shell.sh

# Install gui packages
if ls /usr/bin/*session | grep gnome; then
	sudo apt-get install -y vim-gui-common fonts-powerline
fi

# Install oh-my-zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O - | sh

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

# Configure vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
mkdir -p ~/.vim/swaps
mkdir -p ~/.vim/backups
mkdir -p ~/.vim/undos
mkdir -p ~/.vim/spell

# Add plugins
$DIR/plugins.sh

# Install fzf, used by the oh-my-zsh fzf plugin
$DIR/../scripts/install-fzf.sh

# Configure neovim
$DIR/../scripts/conf-neovim.sh

# Set default shell
sudo chsh -s $(which zsh) $USER
