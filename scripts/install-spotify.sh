#!/bin/bash -e

KEYRING=/etc/apt/keyrings/spotify.gpg

# Add repositories
curl -fsSL https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo gpg --dearmor -o $KEYRING
echo "deb [signed-by=$KEYRING] http://repository.spotify.com stable non-free" | \
    sudo tee /etc/apt/sources.list.d/spotify.list

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install spotify-client spotify-client-gnome-support -y