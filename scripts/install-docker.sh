#!/bin/bash -e

# Install packages
sudo apt-get install docker.io -y

# Configure service
sudo systemctl start docker
sudo systemctl enable docker

# Install docker-compose
sudo -H pip3 install --upgrade docker-compose

# Add current user to docker group
sudo usermod -a -G docker $USER
