#!/bin/bash -e

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

# Install packages
sudo apt install guake -y

# Configure startup indicator
mkdir -p ~/.config/autostart
cp $DIR/conf/guake.desktop ~/.config/autostart
