#!/bin/bash

for KEY_FILE in $HOME/.ssh/id_*
do
	ssh-add $KEY_FILE
done