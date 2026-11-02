#!/bin/bash -e

# Install nvm
mkdir -p ~/.nvm

NVM_VERSION=0.40.8
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v$NVM_VERSION/install.sh | bash
