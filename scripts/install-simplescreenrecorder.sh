#!/bin/bash

# Add repositories
sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install simplescreenrecorder -y
