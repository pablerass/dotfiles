#!/bin/bash -e

# Install Claude Code using the official native installer
# It installs the binary in ~/.local/bin and updates itself in the background
curl -fsSL https://claude.ai/install.sh | bash

# Install used fonts
sudo apt install fonts-noto-core fonts-symbola -y