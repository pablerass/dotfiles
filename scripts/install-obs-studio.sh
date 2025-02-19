#!/bin/bash -e

# Add repositories
sudo add-apt-repository ppa:obsproject/obs-studio -y

# Install packages
sudo apt install ffmpeg obs-studio -y