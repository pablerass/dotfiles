#!/bin/bash

SSH_DIR=$HOME/.ssh
OWN_KEY=$SSH_DIR/id_rsa.$USER

for KEY_FILE in $SSH_DIR/id_*
do
	if [ $KEY_FILE != $OWN_KEY ]; then
		ssh-add $KEY_FILE
	fi
done