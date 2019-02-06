#!/bin/bash -e

# Add repositories
sudo add-apt-repository ppa:webupd8team/atom -y

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt -y install atom

# Install Atom packages
apm install project-manager
apm install minimap
apm install merge-conflicts
apm install vim-mode
apm install linter
apm install linter-flake8
apm install atom-django
