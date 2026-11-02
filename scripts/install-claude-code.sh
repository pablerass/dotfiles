#!/bin/bash -e

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

# Install Claude Code using the official native installer
# It installs the binary in ~/.local/bin and updates itself in the background
curl -fsSL https://claude.ai/install.sh | bash

# Install used fonts
$DIR/install-additional-fonts.sh
