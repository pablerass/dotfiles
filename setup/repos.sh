#!/bin/bash

GITHUB_URL=https://github.com

# oh-my-zsh plugins
LOCAL_DIR=~/.oh-my-zsh/custom/plugins/virsh/.git
if [ -d $LOCAL_DIR ]
then
	git -C $LOCAL_DIR pull origin master 
else
	git clone $GITHUB_URL/jplitza/zsh-virsh-autocomplete.git $LOCAL_DIR
fi

# Vim plugins
LOCAL_DIR=~/.vim/bundle/vim-airline
if [ -d $LOCAL_DIR ]
then
	git -C $LOCAL_DIR pull origin master 
else
	git clone $GITHUB_URL/bling/vim-airline.git $LOCAL_DIR
fi

LOCAL_DIR=~/.vim/bundle/vim-fugitive
if [ -d $LOCAL_DIR ]
then
	git -C $LOCAL_DIR pull origin master 
else
	git clone $GITHUB_URL/tpope/vim-fugitive.git $LOCAL_DIR
fi
