#!/bin/bash -ex

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIR=$DIR/../scripts

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install -y keepassxc

# Call other install scripts
$SCRIPTS_DIR/conf-gnome-shell.sh
$SCRIPTS_DIR/conf-python.sh
$SCRIPTS_DIR/install-chrome.sh
$SCRIPTS_DIR/install-dropbox.sh
$SCRIPTS_DIR/install-gimp.sh
$SCRIPTS_DIR/install-guake.sh
$SCRIPTS_DIR/install-spotify.sh
$SCRIPTS_DIR/install-breaktimer.sh
