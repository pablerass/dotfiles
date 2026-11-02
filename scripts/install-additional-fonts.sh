#!/bin/bash -e

# Install packages
sudo apt install fonts-crosextra-caladea fonts-crosextra-carlito ttf-mscorefonts-installer -y
# Fonts used by Claude Code
sudo apt install fonts-noto-core fonts-symbola -y

# Install powerline fonts
wget -N https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/

# Install Nerd Fonts symbols only font, used by neovim plugins icons. The terminal
# uses it as fallback for missing glyphs, so there is no need to change its font.
pkg=NerdFontsSymbolsOnly.tar.xz
fonts_dir=${XDG_DATA_HOME:-$HOME/.local/share}/fonts/NerdFontsSymbolsOnly
wget -N https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$pkg
rm -rf $fonts_dir
mkdir -p $fonts_dir
tar -C $fonts_dir -xJf $pkg
rm -f $pkg
fc-cache -f $fonts_dir
