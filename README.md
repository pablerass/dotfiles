# dotfiles

## Description

* Set *aliases*.
* Configures the following applications:

  * Vim.
  * Neovim, with LSP, treesitter and Claude Code integration (`scripts/conf-neovim.sh`).
  * Zsh.
  * Git.
  * Tmux.

* Contains `~/bin` folder with useful scripts.
* Contains multiple script to install different aplications.

All this is designed to work properly on an **Ubuntu 14.04**.

## Installation instructions

```sh
cd $HOME
git clone https://github.com/pablerass/dotfiles.git
dotfiles/setup/install.sh
```

Used repositories are updated execution `dotfiles/setup/repos.sh`
