# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="candy"

plugins=(gnu-utils systemadmin systemd man rsync tmux git \
		vagrant terraform terragrunt aws heroku \
		docker docker-compose virtualbox virsh \
		pip python pyenv node npm nvm bower yarn grunt gulp meteor \
		ruby gem rbenv rvm rake mvn ant gradle \
        stack cargo rust golang glide\
		knife kitchen)

source $ZSH/oh-my-zsh.sh

# Customize
export PATH=$PATH:$HOME/bin:$HOME/bin/local

source $HOME/dotfiles/alias
source $HOME/dotfiles/functions
source $HOME/dotfiles/z.sh
if [ -f $HOME/.alias.local ]; then
    source $HOME/.alias.local
fi
if [ -f $HOME/.functions.local ]; then
    source $HOME/.functions.local
fi

export LANG=es_ES.UTF-8

export EDITOR=/usr/bin/vim

# Configure terminal color for tmux compatibility
if [[ $TERM == xterm ]]; then
	TERM=xterm-256color
fi

# Configure installed apps
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
	source /usr/local/bin/virtualenvwrapper.sh
fi

# Load travis configuration
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# Tools variables
export PATH="/usr/local/heroku/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
export GOPATH="~/workspace/go"

# Load rust configuration
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env
