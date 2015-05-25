#!/bin/bash

# Add repositories
sudo apt-add-repository ppa:otto-kesselgulasch/gimp -y

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install gimp -y
