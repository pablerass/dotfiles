#!/bin/bash

# Add repositories
sudo apt-add-repository ppa:ansible/ansible -y

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install ansible -y
