#!/bin/bash -e

# Create config dir
OPENVPN_CONF_DIR=$HOME/conf/openvpn

mkdir -p $OPENVPN_CONF_DIR

# Set visudo config
export OPENVPN_LINE="$USER ALL=(ALL:ALL) NOPASSWD:/usr/sbin/openvpn --config $OPENVPN_CONF_DIR/*.ovpn --daemon ovpn-*"
sudo -E bash -c 'echo "$OPENVPN_LINE" | (EDITOR="tee" visudo -f /etc/sudoers.d/openvpn-conn)'
