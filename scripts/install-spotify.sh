#!/bin/bash

# Add repositories
sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install spotify-client -y