#!/bin/bash

# Add repositories
sudo add-apt-repository ppa:caffeine-developers/ppa -y

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install caffeine -y
