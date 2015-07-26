#!/bin/bash

# Add repositories
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sudo sh -c "echo deb https://get.docker.com/ubuntu docker main\
> /etc/apt/sources.list.d/docker.list"

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install lxc-docker -y