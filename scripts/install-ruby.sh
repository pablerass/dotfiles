#!/bin/bash -e

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install ruby2.0 ruby2.0-dev -y

# Create update symbolic links
for link in ruby gem irb rdoc erb; do
	if [ -f /usr/bin/$link ]; then
		sudo rm /usr/bin/$link
		sudo ln -s /usr/bin/${link}2.0 /usr/bin/$link
	fi
done
