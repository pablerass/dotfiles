#!/bin/bash -e

# Add repositories
sudo sh -c "echo deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe > /etc/apt/sources.list.d/i3.list"
sudo apt-get update -y
sudo apt-get --allow-unauthenticated install sur5r-keyring -y

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install i3 -y

