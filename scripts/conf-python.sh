#!/bin/bash -e

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

# Install packages
sudo apt install python python-pip -y
sudo apt install python3-pip -y
sudo apt install ctags -y

# Update pip
$DIR/update-pip.sh

# Install python libs
sudo -H pip install --ignore-installed \
        --upgrade --upgrade-strategy=eager \
        jedi flake8 flake8-docstrings \
        ipython[all] ipdb \
        # Latest 20.x version of virtualenv broke access to jedi inside vim
        "virtualenv<20.0.0" pipenv virtualenvwrapper \
        requests[security] grip httpie
