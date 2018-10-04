#!/bin/bash -e

# Add repositories
sudo add-apt-repository ppa:tmate.io/archive -y

# Update repos
sudo apt update -y

# Install package
sudo apt install tmate -y
