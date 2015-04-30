#!/bin/bash

# Add repositories
sudo apt-add-repository ppa:git-core/ppa -y

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install git -y
