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
update_repo $GITHUB_URL/jplitza/zsh-virsh-autocomplete.git \
			$OH_MY_ZSH_PLUGINS_DIR/virsh
update_repo $GITHUB_URL/technosophos/glide-zsh.git \
			$OH_MY_ZSH_PLUGINS_DIR/glide

# Vim plugins
update_repo $GITHUB_URL/scrooloose/nerdtree.git $VIM_PLUGINS_DIR/nerdtree
update_repo $GITHUB_URL/vim-airline/vim-airline.git $VIM_PLUGINS_DIR/vim-airline
update_repo $GITHUB_URL/vim-airline/vim-airline-themes.git \
			$VIM_PLUGINS_DIR/vim-airline-themes
update_repo $GITHUB_URL/davidhalter/jedi-vim.git $VIM_PLUGINS_DIR/jedi-vim
update_repo $GITHUB_URL/tpope/vim-fugitive.git $VIM_PLUGINS_DIR/vim-fugitive
update_repo $GITHUB_URL/tpope/vim-surround $VIM_PLUGINS_DIR/vim-surround
update_repo $GITHUB_URL/nvie/vim-flake8.git $VIM_PLUGINS_DIR/vim-flake8
update_repo $GITHUB_URL/python-rope/ropevim.git $VIM_PLUGINS_DIR/ropevim
update_repo $GITHUB_URL/JamshedVesuna/vim-markdown-preview.git \
			$VIM_PLUGINS_DIR/vim-markdown-preview
update_repo $GITHUB_URL/airblade/vim-gitgutter.git \
			$VIM_PLUGINS_DIR/vim-gitgutter
update_repo $GITHUB_URL/vim-scripts/netrw.vim.git \
			$VIM_PLUGINS_DIR/netwr
update_repo $GITHUB_URL/Glench/Vim-Jinja2-Syntax.git \
			$VIM_PLUGINS_DIR/vim-jinja2-syntax
