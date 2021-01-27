#!/bin/bash -e

sudo apt install curl git-core gcc make zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libssl-dev \
    llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

PYENV_DIR=$HOME/.pyenv
if [ ! -e "$PYENV_DIR" ]; then
    git clone https://github.com/pyenv/pyenv.git "$PYENV_DIR"
else
    git -C "$PYENV_DIR" pull origin master
fi
