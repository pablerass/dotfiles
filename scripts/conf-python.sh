#!/bin/bash -e

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

# Install packages
sudo apt-get install python2.7 python-pip -y
sudo apt-get install python3-pip -y
sudo apt-get install python2.7-dev python-dev libffi-dev libssl-dev -y

# Update pip
$DIR/update-pip.sh

# Install python libs
sudo -H pip3 install --upgrade \
		jedi flake8 flake8-docstrings ropevim \
		ipython[all] simplejson pyyaml \
		virtualenv virtualenvwrapper \
		requests[security] \
		grip pipenv
