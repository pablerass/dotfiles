#!/bin/bash

# Install packages
curl https://install.meteor.com | /bin/sh

# Correct meteor privileges depending on your umask configuration
sudo chmod go+rx /usr/local/bin/meteor
