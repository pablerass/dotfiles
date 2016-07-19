#!/bin/bash -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install -y \
	keepassx guake autokey-gtk shutter inkscape

# Call other install scripts
$DIR/configure-python.sh
$DIR/install-additional-fonts.sh
$DIR/install-caffeine.sh
$DIR/install-cardreader.sh
$DIR/install-chrome.sh
$DIR/install-dropbox.sh
$DIR/install-gimp.sh
$DIR/install-google-talk-plugin.sh
$DIR/install-openshot.sh
$DIR/install-simplescreenrecorder.sh
$DIR/install-spotify.sh
$DIR/install-virtualbox.sh
