#!/bin/bash -e

# Add repositories
sudo add-apt-repository ppa:inkscape.dev/stable -y

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install inkscape -y
