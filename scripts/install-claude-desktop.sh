#!/bin/bash -e

# Official Claude Desktop beta for Ubuntu 22.04+ / Debian 12+ (amd64, arm64)
# Same path/name as the package's own entry so apt does not see duplicates
KEYRING=/usr/share/keyrings/claude-desktop-archive-keyring.asc

# Add repositories
sudo curl -fsSLo $KEYRING https://downloads.claude.ai/claude-desktop/key.asc
echo "deb [arch=amd64,arm64 signed-by=$KEYRING] https://downloads.claude.ai/claude-desktop/apt/stable stable main" | \
    sudo tee /etc/apt/sources.list.d/claude-desktop.list

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install claude-desktop -y
