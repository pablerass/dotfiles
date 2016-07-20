#!/bin/bash -e

# Install packages
sudo apt-get install caffeine -y

# Configure startup indicator
sudo sed -i 's/\/usr\/bin\/caffeine$/\/usr\/bin\/caffeine-indicator/' /etc/xdg/autostart/caffeine.desktop
