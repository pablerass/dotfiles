#!/bin/bash -e

# Install packages
sudo apt-get install virtualbox virtualbox-qt virtualbox-ext-pack -y

# Add to virtualbox group
sudo usermod -a -G vboxusers $USER
