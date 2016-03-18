#!/bin/bash -e

# Install packages
sudo apt-get install python-pip python3-pip -y
sudo apt-get install python-dev libffi-dev libssl-dev -y

# Install python libs
sudo -H pip3 install --upgrade \
		virtualenv virtualenvwrapper \
		flake8 flake8-docstrings \
		ipython[all] simplejson pyyaml \
		requests[security] \
		grip

sudo -H pip install --upgrade \
		jedi flake8 flake8-docstrings
