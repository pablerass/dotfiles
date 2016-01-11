#!/bin/bash -e

# Add repositories
sudo add-apt-repository ppa:klaus-vormweg/awesome -y

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get -y install awesome

