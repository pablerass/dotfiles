#!/bin/bash -e

# Add repositories
sudo apt-add-repository ppa:yktooo/ppa -y

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install indicator-sound-switcher -y
