#!/bin/bash -e

# Add repositories
sudo apt-add-repository ppa:otto-kesselgulasch/gimp -y

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install gimp -y
