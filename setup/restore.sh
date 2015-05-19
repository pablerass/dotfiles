#!/bin/bash

# Get script directory
script="$(readlink -f $0)"
setup_dir="$(dirname $script)"
base_dir="$(dirname $setup_dir)"

# Uninstall oh-my-zsh
rm ~/.oh-my-zsh -rf

# Restore backed config files
if [ -f ~/.gitconfig.bak ];
then
	mv ~/.gitconfig.bak ~/.gitconfig -f
else
	rm ~/.gitconfig -f
fi

if [ -f ~/.zshrc.bak ];
then
	mv ~/.zshrc.bak ~/.zshrc -f
else
	rm ~/.zshrc -f
fi

if [ -f ~/.tmux.conf.bak ];
then
	mv ~/.tmux.conf.bak ~/.tmux.conf -f
else
	rm ~/.tmux.conf -f
fi

if [ -f ~/.vimrc.bak ];
then
	mv ~/.vimrc.bak ~/.vimrc -f
else
	rm ~/.vimrc -f
fi

if [ -f ~/.bin.bak ];
then
	mv ~/.bin.bak ~/bin -f
else
	rm ~/bin -f
fi

# Removing vim configuration
rm ~/.vim -rf

# Set default shell
sudo chsh -s $(which bash) $USER
