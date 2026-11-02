#!/bin/bash -e

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
NVIM=/opt/nvim/bin/nvim
CONFIG_DIR=${XDG_CONFIG_HOME:-$HOME/.config}/nvim
SOURCE_CONFIG_DIR=$(cd "$DIR/../nvim" && pwd)

# Install neovim if not present
if [ ! -x $NVIM ]; then
    $DIR/install-neovim.sh
fi

# Install dependencies
#  - build-essential: compile treesitter parsers
#  - python3-venv: install python based language servers (basedpyright, ruff) with mason
#  - nodejs/npm: install node based language servers (bash, yaml, json) with mason
#  - ripgrep, fd-find: search files and contents in pickers
#  - xclip, wl-clipboard: system clipboard integration
sudo apt install -y git curl unzip tar build-essential python3-venv \
                    ripgrep fd-find xclip wl-clipboard
if ! command -v npm > /dev/null; then
    $DIR/install-nodejs.sh
fi
# Install fonts, including icons used by plugins
$DIR/install-additional-fonts.sh

# Link configuration, backing up any previous one
mkdir -p "$(dirname "$CONFIG_DIR")"
if [ -e "$CONFIG_DIR" ] && [ ! -L "$CONFIG_DIR" ]; then
    echo "Creating $CONFIG_DIR backup"
    rm -rf "$CONFIG_DIR.bak"
    mv "$CONFIG_DIR" "$CONFIG_DIR.bak"
fi
ln -sfn "$SOURCE_CONFIG_DIR" "$CONFIG_DIR"

# Install plugins, language servers, tools and treesitter parsers
echo "> Installing plugins"
$NVIM --headless "+Lazy! restore" +qa
echo "> Installing language servers and tools"
$NVIM --headless "+MasonToolsInstallSync" +qa
echo "> Installing treesitter parsers"
$NVIM --headless "+TSInstallAll" +qa
