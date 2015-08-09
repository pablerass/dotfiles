#!/bin/bash

while true; do
	clear
	cat ~/.zsh_history | cut -d\; -f2- | tail -n 5 | tac | nl
	sleep 2
done

