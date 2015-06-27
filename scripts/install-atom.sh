#!/bin/bash

# Add repositories
sudo add-apt-repository ppa:webupd8team/atom -y

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get -y install atom

# Install Atom packages
apm install merge-conflicts
apm install vim-mode
