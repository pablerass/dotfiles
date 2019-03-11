#!/bin/bash -e

# Add repositories
curl -s https://packagecloud.io/install/repositories/datawireio/telepresence/script.deb.sh | sudo bash
rm telepresence.log

# Install packages
sudo apt -y install --no-install-recommends telepresence
