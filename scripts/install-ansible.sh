#!/bin/bash -e

source /etc/lsb-release

# Install packages
sudo -H pip install --upgrade \
		"ansible>=2.3.0<2.4.0" \
		"ansible-container"
