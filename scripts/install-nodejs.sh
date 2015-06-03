#!/bin/bash

# Add repositories

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install nodejs npm -y

# Create symbolic link
sudo ln -s /usr/bin/nodejs /usr/bin/node
