#!/bin/bash -e

EXTENSIONS_DIR=$HOME/.config/inkscape/extensions

# Add repositories
sudo add-apt-repository ppa:inkscape.dev/stable -y

## Install packages
sudo apt install inkscape -y

# Add extensions
curl -o $EXTENSIONS_DIR/countersheet.inx https://raw.githubusercontent.com/lifelike/countersheetsextension/master/countersheet.inx
curl -o $EXTENSIONS_DIR/countersheet.py https://raw.githubusercontent.com/lifelike/countersheetsextension/master/countersheet.py
curl -o $EXTENSIONS_DIR/hexmap.inx https://raw.githubusercontent.com/lifelike/hexmapextension/master/hexmap.inx
curl -o $EXTENSIONS_DIR/hexmap.py https://raw.githubusercontent.com/lifelike/hexmapextension/master/hexmap.py
