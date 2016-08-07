#!/bin/bash -e

# Add repositories
sudo add-apt-repository -y ppa:strukturag/libde265

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get -y install gstreamer0.10-libde265 gstreamer1.0-libde265 \
						vlc-plugin-libde265
