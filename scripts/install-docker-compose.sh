#!/bin/bash -e

# Requires the Docker repository added by install-docker.sh

# Update repos
sudo apt update -y

# Install packages
sudo apt install docker-compose-plugin -y
