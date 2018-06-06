#!/bin/bash -e

# Add repositories
sudo apt-add-repository ppa:yktooo/ppa -y

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install indicator-sound-switcher -y
