#!/bin/bash -e

# Add repositories
#gpg --keyserver hkp://keyserver.ubuntu.com --search-key 'Spotify Public Repository Signing Key'
sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys A87FF9DF48BF1C90

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install spotify-client -y