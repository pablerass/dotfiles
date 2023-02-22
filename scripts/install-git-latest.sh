#!/bin/bash -e

# Add repositories
sudo apt-add-repository ppa:git-core/ppa -y

# Install packages
sudo apt install git -y
