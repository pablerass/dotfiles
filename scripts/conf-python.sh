#!/bin/bash -e

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

# Install packages
sudo apt install python3-pip -y
sudo apt install universal-ctags -y

# Update pip
$DIR/update-pip.sh
$DIR/install-pyenv.sh

# Install python libs
# NOTE: Latest 20.x version of virtualenv broke access to jedi inside vim
sudo -H pip3 install \
        --upgrade --upgrade-strategy=eager \
        jedi flake8 flake8-docstrings \
        ipython ipdb pyreadline \
        notebook jupyterlab \
        "virtualenv<20" pipenv virtualenvwrapper \
        requests[security] grip httpie

