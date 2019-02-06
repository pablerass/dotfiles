#!/bin/bash -e

# Documentation
# http://sharadchhetri.com/2014/10/09/install-kvm-kernel-based-virtual-machine-ubuntu-14-04-lts-desktop/

# Add repositories

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install qemu-kvm libvirt-bin bridge-utils -y
sudo apt install ubuntu-vm-builder virt-manager -y

# Configure packages
