#!/bin/bash -e

# Add repositories
sudo apt-add-repository -y ppa:remmina-ppa-team/remmina-next

# Update repos and packages
sudo apt -y update

# Install packages
sudo apt -y install remmina remmina-plugin-rdp libfreerdp-plugins-standard

