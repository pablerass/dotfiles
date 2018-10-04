#!/bin/bash -e

# Add repositories
sudo add-apt-repository ppa:klaus-vormweg/awesome -y

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt -y install awesome

