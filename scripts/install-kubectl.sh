#!/bin/bash -e


VER=1.29

# Add repositories
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.pgp] https://pkgs.k8s.io/core:/stable:/v$VER/deb/ /" | \
    sudo tee /etc/apt/sources.list.d/kubernetes.list
curl -fsSL https://pkgs.k8s.io/core:/stable:/v$VER/deb/Release.key | \
    sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install kubectl -y