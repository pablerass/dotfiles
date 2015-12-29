#!/bin/bash -e

# Install packages
#	jq - enables json parsing from bash
sudo apt-get install jq

# Install python libs
sudo -H pip install awscli
