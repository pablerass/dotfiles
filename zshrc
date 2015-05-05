# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="candy"

plugins=(git vagrant docker systemadmin pip python pyenv mvn ant virsh)

source $ZSH/oh-my-zsh.sh

# Customize
export PATH=$PATH:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:

source $HOME/dotfiles/alias
source $HOME/dotfiles/functions
source $HOME/dotfiles/z.sh

export LANG=es_ES.UTF-8

# Configure installed apps
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
	source /usr/local/bin/virtualenvwrapper.sh
fi
