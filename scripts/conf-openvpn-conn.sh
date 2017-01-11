#!/bin/bash -e

# Create config dir
OPENVPN_CONF_DIR=$HOME/conf/openvpn

mkdir -p $OPENVPN_CONF_DIR

# Set visudo config
CMND_ALIAS="VPN_$(echo $USER | tr '[:lower:]' '[:upper:]')"

export OPENVPN_LINE="""Cmnd_Alias $CMND_ALIAS= \\
	/usr/sbin/openvpn --config $OPENVPN_CONF_DIR/*.ovpn --daemon ovpn-*, \\
	/usr/bin/pkill -f /usr/sbin/openvpn --config $OPENVPN_CONF_DIR/*.ovpn --daemon ovpn-*

$USER ALL=(ALL:ALL) NOPASSWD:$CMND_ALIAS"""
export SUDOERS_FILE=/etc/sudoers.d/openvpn-conn-$USER

sudo -E bash -c 'echo "$OPENVPN_LINE" | (EDITOR="tee" visudo -s -f $SUDOERS_FILE)'
