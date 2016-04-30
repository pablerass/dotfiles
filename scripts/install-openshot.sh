#!/bin/bash -e

# Add repositories
sudo add-apt-repository ppa:openshot.developers/ppa -y

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get -y install openshot-qt
