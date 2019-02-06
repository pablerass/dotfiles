#!/bin/bash -e

# Add repositories
sudo apt-add-repository ppa:git-core/ppa -y

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install git -y
