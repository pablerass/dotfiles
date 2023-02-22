#!/bin/bash -e

# Add repositories
sudo apt-add-repository ppa:otto-kesselgulasch/gimp -y

# Install packages
sudo apt install gimp -y
