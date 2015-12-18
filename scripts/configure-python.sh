#!/bin/bash

# Install packages
sudo apt-get install python-pip python3-pip -y

# Install python libs
sudo -H pip3 install --upgrade \
		virtualenv virtualenvwrapper \
		flake8 flake8-docstrings \
		ipython[all] simplejson pyyaml \
		requests[security]
