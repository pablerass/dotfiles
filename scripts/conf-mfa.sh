#!/bin/bash -e

# Create config dir
MFA_CONF_DIR=$HOME/conf/mfa

mkdir -p $MFA_CONF_DIR

# Install tools
sudo apt install oathtool xclip -y
