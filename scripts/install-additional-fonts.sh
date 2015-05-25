#!/bin/bash

# Install packages
sudo apt-get install fonts-crosextra-caladea fonts-crosextra-carlito ttf-mscorefonts-installer -y

# Install powerline fonts
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/