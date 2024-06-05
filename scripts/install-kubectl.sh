#!/bin/bash -e

VER=1.29
KEYRING=/etc/apt/keyrings/kubernetes-archive-keyring.gpg

# Add repositories
curl -fsSL https://pkgs.k8s.io/core:/stable:/v$VER/deb/Release.key | sudo gpg --dearmor -o $KEYRING
echo "deb [signed-by=$KEYRING] https://pkgs.k8s.io/core:/stable:/v$VER/deb/ /" | \
    sudo tee /etc/apt/sources.list.d/kubernetes.list

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install kubectl -y