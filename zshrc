# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="candy"

plugins=(git vagrant docker systemadmin pip python pyenv)

source $ZSH/oh-my-zsh.sh

# Customize
export PATH=$PATH:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:

source $HOME/dotfiles/alias
source $HOME/dotfiles/functions
source $HOME/dotfiles/z.sh

export LANG=es_ES.UTF-8
