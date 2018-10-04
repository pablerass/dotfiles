#!/bin/bash -e

source /etc/lsb-release
DISTRO=$DISTRIB_CODENAME
DISTRO=xenial # bionic distro does not yet exists in repository

# Add repositories
sudo sh -c "echo deb http://apt.kubernetes.io/ kubernetes-$DISTRO main > /etc/apt/sources.list.d/kubernetes.list"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install kubeadm -y