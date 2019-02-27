#!/bin/bash -e

# Add repositories
sudo add-apt-repository ppa:projectatomic/ppa -y

# Install packages
sudo apt -y install skopeo buildah podman cri-o-runc

# Not PPA defined dependencies
sudo apt -y install uidmap
