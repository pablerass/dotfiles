#!/bin/bash -e

# Add repositories
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sudo sh -c "echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list"

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install lxc-docker -y

# Install docker-compose
sudo sh -c "curl -L https://github.com/docker/compose/releases/download/1.4.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose

# Install docker-machine
sudo sh -c "curl -L https://github.com/docker/machine/releases/download/v0.5.3/docker-machine_linux-amd64 >/usr/local/bin/docker-machine"
sudo chmod +x /usr/local/bin/docker-machine

# Add current user to docker group
sudo usermod -a -G docker $USER
