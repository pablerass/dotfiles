#!/bin/bash -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install previous
$DIR/install-mongo-shell.sh

# Install packages
sudo apt install mongodb-org -y

# Install additional tools
sudo apt install python-matplotlib
sudo -H pip install mtools
