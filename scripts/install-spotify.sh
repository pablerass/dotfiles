#!/bin/bash -e

KEYRING=/etc/apt/keyrings/spotify.gpg

# Add repositories
curl -fsSL https://download.spotify.com/debian/pubkey_5384CE82BA52C83A.asc| \
    sudo gpg --yes --dearmor -o $KEYRING
echo "deb [signed-by=$KEYRING] https://repository.spotify.com stable non-free" | \
    sudo tee /etc/apt/sources.list.d/spotify.list > /dev/null

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install spotify-client spotify-client-gnome-support -y