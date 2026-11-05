#!/bin/bash -e

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
KEYRING=/etc/apt/keyrings/docker.asc
CODENAME=$(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")

# Remove conflicting distribution packages, stopping docker first because
# docker.socket would otherwise keep running without a working socket
CONFLICTS=$(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc podman-docker containerd runc 2>/dev/null | awk '$2 == "install" {print $1}')
if [ -n "$CONFLICTS" ]; then
    sudo systemctl stop docker.service docker.socket || true
    sudo apt remove -y $CONFLICTS
fi

# Add repositories
sudo curl -fsSLo $KEYRING https://download.docker.com/linux/ubuntu/gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=$KEYRING] https://download.docker.com/linux/ubuntu $CODENAME stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list

# Update repos
sudo apt update -y

# Install packages
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin -y

# Install docker compose
$DIR/install-docker-compose.sh

# Configure service
sudo systemctl start docker
sudo systemctl enable docker

# Add current user to docker group
sudo usermod -a -G docker $USER
