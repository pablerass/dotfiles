#!/bin/bash -e

# Add repositories
sudo add-apt-repository ppa:tmate.io/archive -y

# Update repos
sudo apt-get update -y

# Install package
sudo apt-get install tmate -y
