#!/bin/bash -e

# Add repositories
sudo add-apt-repository ppa:openshot.developers/ppa -y

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt -y install openshot-qt
