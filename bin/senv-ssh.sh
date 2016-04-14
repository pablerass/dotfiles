#!/bin/bash

ENV=$1

# Get environment if not specified
if [ -z $ENV ]; then
	read -p "SSH environment: " ENV
fi

CONF_DIR=~/.ssh
CONF_ENV_DIR=$CONF_DIR/$ENV

# Check if environment exists
if [ ! -d $CONF_ENV_DIR ]; then
	echo "ERROR: $ENV environment does not exist"
	exit 1
fi

# Update config file
CONF_FILE=$CONF_DIR/config
CONF_ENV_FILE=$CONF_ENV_DIR/config

if [ -e $CONF_FILE ] && [ ! -L $CONF_FILE ]; then
	echo "ERROR: $CONF_FILE is not a symbolic link"
	exit 2
fi

if [ -f $CONF_ENV_FILE ]; then
	ln -sf $CONF_ENV_FILE $CONF_FILE
else
	echo "ERROR: $ENV environment configuration file does not exist"
	exit 3
fi

# Update private key files
KEYS=$CONF_DIR/id_rsa.*
ENV_KEYS=$CONF_ENV_DIR/id_rsa.*

for KEY_FILE in `ls -d $KEYS`; do
	if [ -L $KEY_FILE ]; then
		rm $KEY_FILE
	else
		if [ ! -d $CONF_FILE ]; then
			echo "WARNING: $CONF_FILE is not a symbolic link"
		fi
	fi
done

for ENV_KEY_FILE in `ls -d $ENV_KEYS`; do
	ln -sf $ENV_KEY_FILE $CONF_DIR/$(basename $ENV_KEY_FILE)
done
