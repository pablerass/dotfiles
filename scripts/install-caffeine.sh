#!/bin/bash -e

# Add repositories
sudo add-apt-repository ppa:caffeine-developers/ppa -y

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install caffeine -y

# Configure startup indicator
sed -i 's/\/usr\/bin\/caffeine/\/usr\/bin\/caffeine-indicator/' ~/.config/autostart/caffeine.desktop
