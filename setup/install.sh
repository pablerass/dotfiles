#!/bin/bash

# Install packages
sudo apt-get install git vim zsh htop curl -y

# Install oh-my-zsh
wget --no-check-certificate http://install.ohmyz.sh -O - | sh

# Add autocompletion plugins
git clone https://github.com/jplitza/zsh-virsh-autocomplete.git ~/.oh-my-zsh/custom/plugins/virsh

# Remove current config files
if [ -f ~/.gitconfig ];
then
	mv ~/.gitconfig ~/.gitconfig.bak
fi

if [ -f ~/.zshrc ];
then
	mv ~/.zshrc ~/.zshrc.bak
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
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/bin ~/bin

# Configure vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
mkdir -p ~/.vim/swaps
mkdir -p ~/.vim/backups
mkdir -p ~/.vim/undos

# Add vim plugins
git clone https://github.com/bling/vim-airline.git ~/.vim/bundle/vim-airline
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive

# Set default shell
sudo chsh -s $(which zsh) $USER
