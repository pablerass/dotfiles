#!/bin/bash -e

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

# Install packages
sudo apt-get install python python-pip -y
sudo apt-get install python3-pip -y

# Update pip
$DIR/update-pip.sh

# Install python libs
sudo -H pip3 install --upgrade \
		jedi flake8 flake8-docstrings ropevim \
		ipython[all] virtualenv virtualenvwrapper \
		requests[security] pipenv grip
