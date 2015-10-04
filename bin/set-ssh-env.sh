#!/bin/bash

SSH_ENV=$1

# Get environment if not specified
if [ -z $SSH_ENV ]; then
	read -p "SSH environment: " SSH_ENV
fi

SSH_CONF_DIR=~/.ssh
SSH_ENV_CONF_DIR=~/.ssh/$SSH_ENV

# Update config file
SSH_CONF_FILE=$SSH_CONF_DIR/config
SSH_ENV_CONF_FILE=$SSH_ENV_CONF_DIR/config

if [ ! -e $SSH_CONF_FILE ] || [ -L $SSH_CONF_FILE ]; then
	if [ -f $SSH_ENV_CONF_FILE ]; then
		ln -sf $SSH_ENV_CONF_FILE $SSH_CONF_FILE
	else
		echo "ERROR: $SSH_ENV environment does not exist"
		exit -1
	fi
else
	echo "ERROR: $SSH_CONF_FILE is not a symbolic link"
	exit -2
fi

# Update private key files
SSH_KEYS=$SSH_CONF_DIR/id_rsa.*
SSH_ENV_KEYS=$SSH_ENV_CONF_DIR/id_rsa.*

for KEY_FILE in `ls $SSH_KEYS`; do
	if [ -L $KEY_FILE ]; then
		rm $KEY_FILE
	else
		echo "WARNING: $KEY_FILE is not a symbolic link"
	fi
done

for KEY_FILE in `ls $SSH_ENV_KEYS`; do
	ln -sf $KEY_FILE $SSH_CONF_DIR/$(basename $KEY_FILE)
done
