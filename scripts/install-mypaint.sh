#!/bin/bash -e

# Add repositories
sudo add-apt-repository ppa:achadwick/mypaint-testing -y

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt -y install mypaint mypaint-data-extras
