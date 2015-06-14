#!/bin/bash

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

# Install packages
sudo apt-get install git tig vim zsh htop curl -y

# Install oh-my-zsh
wget --no-check-certificate http://install.ohmyz.sh -O - | sh

# Remove current config files
if [ -f ~/.gitconfig ];
then
	mv ~/.gitconfig ~/.gitconfig.bak
fi

if [ -f ~/.zshrc ];
then
	mv ~/.zshrc ~/.zshrc.bak
fi

if [ -f ~/.tmux.conf ];
then
	mv ~/.tmux.conf ~/.tmux.conf.bak
fi

if [ -f ~/.vimrc ];
then
	mv ~/.vimrc ~/.vimrc.bak
fi

if [ -f ~/bin ];
then
	mv ~/bin ~/.bin.bak
fi

# Set new config files
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/bin ~/bin

# Configure vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
mkdir -p ~/.vim/swaps
mkdir -p ~/.vim/backups
mkdir -p ~/.vim/undos
mkdir -p ~/.vim/spell

# Add plugin repos
$DIR/repos.sh

# Set default shell
sudo chsh -s $(which zsh) $USER
