#!/bin/bash -e

source /etc/lsb-release

DISTRO=$DISTRIB_CODENAME
KEYRING=/etc/apt/keyrings/winehq.key

# Add repositories
sudo dpkg --add-architecture i386
curl -fsSL https://dl.winehq.org/wine-builds/winehq.key | sudo gpg --dearmor -o $KEYRING
sudo add-apt-repository ppa:cybermax-dexter/sdl2-backport
echo "deb [signed-by=$KEYRING] https://dl.winehq.org/wine-builds/ubuntu/ $DISTRO main" | \
    sudo tee /etc/apt/sources.list.d/wine.list

# Update repos
sudo apt update -y

# Install packages
sudo apt install -y --install-recommends winehq-stable
