#!/bin/bash -e

# Add repositories
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys B07804338C015B73
sudo sh -c 'echo "deb https://sdkrepo.atlassian.com/debian/ stable contrib" > /etc/apt/sources.list.d/atlassian-sdk.list'

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install atlassian-plugin-sdk -y
