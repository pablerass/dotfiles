#!/bin/bash -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Variables
repo=Paket

# Get code
git clone https://github.com/fsprojects/$repo --depth 1

# Build and install
cd $DIR/$repo
./build.sh
sudo ./install.sh
cd $DIR

# Delete code
rm -Rf $DIR/$repo
