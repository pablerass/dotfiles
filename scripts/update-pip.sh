#!/bin/bash -e

# Update pip versions
sudo -H pip install -U pip
sudo -H pip3 install -U pip

# Correct pip script
sudo sed -i "s/python3/python/" /usr/local/bin/pip
