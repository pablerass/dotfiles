#!/bin/bash -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIR=$DIR/../scripts

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install -y \
	keepassx autokey-gtk shutter inkscape

# Call other install scripts
$SCRIPTS_DIR/install-additional-fonts.sh
$SCRIPTS_DIR/install-caffeine.sh
$SCRIPTS_DIR/install-sound-switcher-indicator.sh
$SCRIPTS_DIR/install-cardreader.sh
$SCRIPTS_DIR/install-chrome.sh
$SCRIPTS_DIR/install-dropbox.sh
$SCRIPTS_DIR/install-gimp.sh
$SCRIPTS_DIR/install-guake.sh
$SCRIPTS_DIR/install-google-talk-plugin.sh
$SCRIPTS_DIR/install-openshot.sh
$SCRIPTS_DIR/install-simplescreenrecorder.sh
$SCRIPTS_DIR/install-spotify.sh
