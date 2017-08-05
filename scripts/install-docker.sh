#!/bin/bash -e

source /etc/lsb-release

DISTRO=$DISTRIB_CODENAME
MACHINE_VERSION=0.12.2

# Add repositories
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo sh -c "echo deb https://apt.dockerproject.org/repo ubuntu-$DISTRO main > /etc/apt/sources.list.d/docker.list"

# Update repos and packages
sudo apt-get update -y

# Remove previous
sudo apt-get purge 'lxc-docker*' -y

# Install packages
sudo apt-get install docker-engine -y

# Install docker-compose
sudo -H pip3 install --upgrade docker-compose

# Install docker-machine
sudo sh -c "curl -L https://github.com/docker/machine/releases/download/v$MACHINE_VERSION/docker-machine_linux-amd64 >/usr/local/bin/docker-machine"
sudo chmod +x /usr/local/bin/docker-machine

# Add current user to docker group
sudo usermod -a -G docker $USER
