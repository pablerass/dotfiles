#!/bin/bash

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install python-pip python3-pip -y

# Install python libs
sudo pip install virtualenv virtualenvwrappers
