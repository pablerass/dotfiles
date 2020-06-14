#!/bin/bash -e

source /etc/lsb-release

DISTRO=$DISTRIB_CODENAME

# Add repositories
sudo dpkg --add-architecture i386
curl -s https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo add-apt-repository ppa:cybermax-dexter/sdl2-backport
sudo sh -c "echo deb https://dl.winehq.org/wine-builds/ubuntu/ $DISTRO main > /etc/apt/sources.list.d/wine.list"

# Update repos
sudo apt update -y

# Install packages
sudo apt install -y --install-recommends winehq-stable
