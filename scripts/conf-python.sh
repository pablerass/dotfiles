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
		jedi flake8 flake8-docstrings ropevim \
		ipython[all] ipdb virtualenv virtualenvwrapper \
		requests[security] pipenv grip httpie
