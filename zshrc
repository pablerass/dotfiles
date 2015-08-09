# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="candy"

plugins=(git tig tmux vagrant docker systemadmin pip python pyenv npm gem mvn ant virsh virtualbox aws)

source $ZSH/oh-my-zsh.sh

# Customize
export PATH=$PATH:$HOME/bin:$HOME/bin/local

source $HOME/dotfiles/alias
source $HOME/dotfiles/functions
source $HOME/dotfiles/z.sh

export LANG=es_ES.UTF-8

# Configure terminal color for tmux compatibility
if [[ $TERM == xterm ]]; then
	TERM=xterm-256color
fi

# Configure installed apps
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
	source /usr/local/bin/virtualenvwrapper.sh
fi
