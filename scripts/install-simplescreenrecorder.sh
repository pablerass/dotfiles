#!/bin/bash -e

# Add repositories
sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder -y

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install simplescreenrecorder -y
