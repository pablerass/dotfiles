#!/bin/bash

## Variables
GITHUB_URL=https://github.com

OH_MY_ZSH_PLUGINS_DIR=~/.oh-my-zsh/custom/plugins
VIM_PLUGINS_DIR=~/.vim/bundle

## Functions
function update_repo {
	LOCAL_DIR=$2
	REPO=$1
	if [ -d "$LOCAL_DIR" ]
	then
		git -C "$LOCAL_DIR" pull origin master
	else
		git clone $REPO "$LOCAL_DIR"
	fi
}

## Repos
# oh-my-zsh plugins
update_repo $GITHUB_URL/jplitza/zsh-virsh-autocomplete.git $OH_MY_ZSH_PLUGINS_DIR/virsh

# Vim plugins
update_repo $GITHUB_URL/scrooloose/nerdtree.git $VIM_PLUGINS_DIR/nerdtree
update_repo $GITHUB_URL/bling/vim-airline.git $VIM_PLUGINS_DIR/vim-airline
update_repo $GITHUB_URL/davidhalter/jedi-vim.git $VIM_PLUGINS_DIR/jedi-vim
update_repo $GITHUB_URL/tpope/vim-fugitive.git $VIM_PLUGINS_DIR/vim-fugitive
