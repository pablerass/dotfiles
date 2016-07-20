#!/bin/bash -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIR=$DIR/../scripts

# Install packages
sudo -H pip install ansible

# Call other install scripts
$SCRIPTS_DIR/configure-python.sh
$SCRIPTS_DIR/install-atom.sh
$SCRIPTS_DIR/install-awscli.sh
$SCRIPTS_DIR/install-docker.sh
$SCRIPTS_DIR/install-eclipse.sh
$SCRIPTS_DIR/install-git-latest.sh
$SCRIPTS_DIR/install-heroku-toolbelt.sh
$SCRIPTS_DIR/install-java.sh
$SCRIPTS_DIR/install-nodejs.sh
$SCRIPTS_DIR/install-packer.sh
$SCRIPTS_DIR/install-slack.sh
$SCRIPTS_DIR/install-terraform.sh
$SCRIPTS_DIR/install-vagrant.sh
$SCRIPTS_DIR/install-virtualbox.sh
