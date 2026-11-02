#!/bin/bash -e

NVIM=/opt/nvim/bin/nvim
CONFIG_DIR=${XDG_CONFIG_HOME:-$HOME/.config}/nvim

# Skip if neovim is not installed or configured yet
if [ ! -x $NVIM ] || [ ! -L "$CONFIG_DIR" ]; then
    echo "Neovim not configured, run scripts/conf-neovim.sh first"
    exit 0
fi

# Update plugins, it rewrites lazy-lock.json in the dotfiles repository
echo "> Updating neovim plugins"
$NVIM --headless "+Lazy! update" +qa
# Update language servers and tools
echo "> Updating neovim language servers and tools"
$NVIM --headless "+MasonToolsUpdateSync" +qa
# Update treesitter parsers
echo "> Updating neovim treesitter parsers"
$NVIM --headless "+lua require('nvim-treesitter').update():wait(600000)" +qa
