#!/bin/bash -e

# Add repositories
sudo apt-add-repository ppa:ubuntuhandbook1/gimp-3 -y

# Install packages
sudo apt install gimp libgegl-0.4-0t64 libbabl-0.1-0 -y
