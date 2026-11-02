#!/bin/bash -e

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

# Install packages
sudo apt install pipx -y
sudo apt install universal-ctags -y

# Install uv and make it available in this script
$DIR/install-uv.sh
export PATH="$HOME/.local/bin:$PATH"

# Install latest Python managed by uv
uv python install

# Install Python CLI tools in isolated environments
for tool in ipython jupyterlab grip httpie; do
    uv tool install --upgrade $tool
done
