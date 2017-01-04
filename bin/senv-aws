#!/bin/bash

ENV=$1

# Get environment if not specified
if [ -z $ENV ]; then
	read -p "AWS environment: " ENV
fi

CONF_DIR=~/.aws
CONF_ENV_DIR=$CONF_DIR/$ENV

# Check if environment exists
if [ ! -d $CONF_ENV_DIR ]; then
	echo "ERROR: $ENV environment does not exist"
	exit 1
fi

# Update all config files
CONF_FILES=$CONF_DIR/*
CONF_ENV_FILES=$CONF_ENV_DIR/*

for CONF_FILE in `ls -d $CONF_FILES`; do
	if [ -L $CONF_FILE ]; then
		rm $CONF_FILE
	else
		if [ ! -d $CONF_FILE ]; then
			echo "WARNING: $CONF_FILE is not a symbolic link"
		fi
	fi
done

for CONF_ENV_FILE in `ls -d $CONF_ENV_FILES`; do
	ln -sf $CONF_ENV_FILE $CONF_DIR/$(basename $CONF_ENV_FILE)
done
