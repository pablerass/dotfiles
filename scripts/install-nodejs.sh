#!/bin/bash

# Add repositories

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install nodejs npm -y

# Create needed symbolic links
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo ln -s /etc/bash_completion.d/npm /usr/share/npm/lib/utils/completion.sh
