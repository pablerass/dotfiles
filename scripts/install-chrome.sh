#!/bin/bash -e

# Add repositories
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
if [ ! -e /etc/apt/sources.list.d/google-chrome.list ]; then
	sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
fi

# Update repos
sudo apt-get update -y

# Install additional packages
sudo apt-get install google-chrome-stable -y
