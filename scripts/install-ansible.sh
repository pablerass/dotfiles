#!/bin/bash -e

# Install packages
sudo -H pip install -U ansible docker
sudo -H pip install -U molecule --ignore-installed
