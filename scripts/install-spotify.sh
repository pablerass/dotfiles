#!/bin/bash -e

# Add repositories
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list'

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install spotify-client spotify-client-gnome-support -y