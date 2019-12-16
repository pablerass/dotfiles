# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="mycandy"

plugins=(z gnu-utils systemadmin systemd man rsync \
    tmux tmuxinator git \
    vagrant terraform terragrunt aws awless \
    docker docker-compose virsh \
    pip python pyenv virtualenvwrapper \
    node npm nvm bower yarn grunt gulp \
    ruby gem rbenv rvm rake \
    mvn ant gradle \
    # zsh-sdkman \
    stack cargo rust golang glide \
    knife kitchen \
    kubectl oc minikube kops helm)

source $ZSH/oh-my-zsh.sh
# Tmuxinator not properly loaded
source ~/.oh-my-zsh/plugins/tmuxinator/_tmuxinator

# Customize
export PATH=$PATH:$HOME/bin:$HOME/bin/local

if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi
source $HOME/dotfiles/alias
source $HOME/dotfiles/functions
if [ -f $HOME/.alias.local ]; then
    source $HOME/.alias.local
fi
if [ -f $HOME/.functions.local ]; then
    source $HOME/.functions.local
fi

export EDITOR=/usr/bin/vim

unsetopt beep

# Configure terminal color for tmux compatibility
if [[ $TERM == xterm ]]; then
    TERM=xterm-256color
fi

# Configure additional
export HOSTALIASES=$HOME/.hostaliases

# Configure installed apps
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Load travis configuration
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# Tools variables
export PATH="/usr/local/heroku/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
export GOPATH="$HOME/.gopath"
export PATH="$GOPATH/bin:$PATH"
[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ] && \. "$HOME/.sdkman/bin/sdkman-init.sh"  # This loads sdkman

# Load rust configuration
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
