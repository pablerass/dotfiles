#!/bin/bash

# Add repositories
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo sh -c "echo deb http://download.virtualbox.org/virtualbox/debian trusty contrib > /etc/apt/sources.list.d/virtualbox.list"

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install virtualbox-5.0 -y

# Add to virtualbox group
sudo usermod -a -G vboxusers $USER
