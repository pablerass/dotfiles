#!/bin/bash -e

# Install nvm
mkdir ~/.nvm

NVM_VERSION=0.39.3
curl -o- https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh | bash
