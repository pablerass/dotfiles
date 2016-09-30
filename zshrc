# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="candy"

plugins=(gnu-utils systemadmin sudo man rsync tmux tmuxinator git tig \
		vagrant terraform docker docker-compose aws virtualbox virsh heroku \
		pip python pyenv node npm bower grunt \
		ruby gem rbenv rake mvn ant gradle )

source $ZSH/oh-my-zsh.sh

# Customize
export PATH=$PATH:$HOME/bin:$HOME/bin/local

source $HOME/dotfiles/alias
source $HOME/dotfiles/functions
source $HOME/dotfiles/z.sh

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


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
