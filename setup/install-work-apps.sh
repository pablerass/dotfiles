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
$SCRIPTS_DIR/conf-mfa.sh
$SCRIPTS_DIR/install-additional-fonts.sh
$SCRIPTS_DIR/install-ansible.sh
$SCRIPTS_DIR/install-awscli.sh
$SCRIPTS_DIR/install-aws-vault.sh
$SCRIPTS_DIR/install-chrome.sh
$SCRIPTS_DIR/install-docker.sh
$SCRIPTS_DIR/install-guake.sh
$SCRIPTS_DIR/install-gimp.sh
$SCRIPTS_DIR/install-git-latest.sh
$SCRIPTS_DIR/install-packer.sh
$SCRIPTS_DIR/install-terraform.sh
$SCRIPTS_DIR/install-vagrant.sh
$SCRIPTS_DIR/install-virtualbox.sh
$SCRIPTS_DIR/install-tmuxinator.sh
$SCRIPTS_DIR/install-spotify.sh
