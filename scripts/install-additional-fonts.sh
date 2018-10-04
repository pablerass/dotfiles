#!/bin/bash -e

# Install packages
sudo apt install fonts-crosextra-caladea fonts-crosextra-carlito ttf-mscorefonts-installer -y

# Install powerline fonts
wget -N https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/