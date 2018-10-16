#!/bin/bash -e

# Install packages
sudo -H pip3 install --upgrade "ansible>=2.6.0<2.7.0"
sudo -H pip3 install molecule docker
