#!/bin/bash -e

KEYRING=/etc/apt/keyrings/google-cloud.gpg

# Add repositories
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o $KEYRING
echo "deb [signed-by=$KEYRING] https://packages.cloud.google.com/apt cloud-sdk main" | \
   sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list

# Update repos
sudo apt update -y

# Install additional packages
sudo apt install google-cloud-sdk -y
