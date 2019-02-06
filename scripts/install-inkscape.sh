#!/bin/bash -e

# Add repositories
sudo add-apt-repository ppa:inkscape.dev/stable -y

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install inkscape -y
