#!/bin/bash -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIR=$DIR/../scripts

# Call other install scripts
$SCRIPTS_DIR/conf-python.sh
$SCRIPTS_DIR/conf-openvpn-conn.sh
$SCRIPTS_DIR/conf-mfa.sh
$SCRIPTS_DIR/install-awscli.sh
$SCRIPTS_DIR/install-docker.sh
$SCRIPTS_DIR/install-git-latest.sh
$SCRIPTS_DIR/install-nodejs.sh
$SCRIPTS_DIR/install-packer.sh
$SCRIPTS_DIR/install-slack.sh
$SCRIPTS_DIR/install-terraform.sh
$SCRIPTS_DIR/install-vagrant.sh
$SCRIPTS_DIR/install-virtualbox.sh
$SCRIPTS_DIR/install-ruby.sh
$SCRIPTS_DIR/install-tmuxinator.sh
