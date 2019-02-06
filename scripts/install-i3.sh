#!/bin/bash -e

# Add repositories
sudo sh -c "echo deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe > /etc/apt/sources.list.d/i3.list"
sudo apt update -y
sudo apt --allow-unauthenticated install sur5r-keyring -y

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install i3 -y

