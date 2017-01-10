#!/bin/bash -e

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

# Install packages
sudo apt-get install python-pip python3-pip -y
sudo apt-get install python-dev libffi-dev libssl-dev -y

# Update pip
$DIR/update-pip.sh

# Install python libs
sudo -H pip3 install --upgrade \
		jedi flake8 flake8-docstrings ropevim \
		ipython[all] simplejson pyyaml \
		requests[security] \
		grip

sudo -H pip install --upgrade \
		virtualenv virtualenvwrapper \
		jedi flake8 flake8-docstrings ropevim
