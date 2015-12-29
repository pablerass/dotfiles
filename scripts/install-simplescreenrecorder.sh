#!/bin/bash -e

# Add repositories
sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder -y

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install simplescreenrecorder -y
