#!/bin/bash -e

# Ensure pipx is available
if ! command -v pipx > /dev/null; then
    sudo apt install pipx -y
fi

# Install uv with pipx, or upgrade it if already installed
if pipx list --short | grep -q '^uv '; then
    pipx upgrade uv
else
    pipx install uv
fi
