#!/bin/bash -e

sudo apt install curl git-core gcc make zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libssl-dev \
    llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

PYENV_DIR=$HOME/.pyenv
if [ ! -e "$PYENV_DIR" ]; then
    git clone https://github.com/pyenv/pyenv.git "$PYENV_DIR"
    cd $PYENV_DIR && src/configure && make -C src
else
    git -C "$PYENV_DIR" pull origin master
fi

PYENV_PLUGINS_DIR=$PYENV_DIR/plugins

PYENV_VIRTUALENV_DIR=$PYENV_PLUGINS_DIR/pyenv-virtualenv
if [ ! -e "$PYENV_VIRTUALENV_DIR" ]; then
    git clone https://github.com/pyenv/pyenv-virtualenv.git "$PYENV_VIRTUALENV_DIR"
else
    git -C "$PYENV_VIRTUALENV_DIR" pull origin master
fi

PYENV_VIRTUALENVWRAPPER_DIR=$PYENV_PLUGINS_DIR/pyenv-virtualenvwrapper
if [ ! -e "$PYENV_VIRTUALENVWRAPPER_DIR" ]; then
    git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git "$PYENV_VIRTUALENVWRAPPER_DIR"
else
    git -C "$PYENV_VIRTUALENVWRAPPER_DIR" pull origin master
fi
