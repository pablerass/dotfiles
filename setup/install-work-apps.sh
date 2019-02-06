#!/bin/bash -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIR=$DIR/../scripts

# Call other install scripts
$SCRIPTS_DIR/conf-python.sh
$SCRIPTS_DIR/conf-mfa.sh
$SCRIPTS_DIR/install-additional-fonts.sh
$SCRIPTS_DIR/install-ansible.sh
$SCRIPTS_DIR/install-awscli.sh
$SCRIPTS_DIR/install-aws-vault.sh
$SCRIPTS_DIR/install-chrome.sh
$SCRIPTS_DIR/install-docker.sh
$SCRIPTS_DIR/install-guake.sh
$SCRIPTS_DIR/install-git-latest.sh
$SCRIPTS_DIR/install-go.sh
$SCRIPTS_DIR/install-nodejs.sh
$SCRIPTS_DIR/install-packer.sh
$SCRIPTS_DIR/install-terraform.sh
$SCRIPTS_DIR/install-vagrant.sh
$SCRIPTS_DIR/install-virtualbox.sh
$SCRIPTS_DIR/install-tmuxinator.sh
