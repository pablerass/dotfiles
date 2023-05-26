# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="mycandy"

# Configure pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

plugins=(z gnu-utils systemadmin systemd man rsync zsh-completions \
    tmux tmuxinator git \
    vagrant terraform terragrunt nomad aws gcloud \
    docker docker-compose virsh \
    pip pipenv virtualenvwrapper httpie \
    node npm nvm bower yarn grunt gulp \
    ruby gem rbenv rvm rake \
    pyenv \
    mvn ant gradle sdk golang glide \
    knife kitchen kubectl oc minikube kops helm)

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

# Configure installed apps
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Load travis configuration
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# Tools variables
export PATH="/usr/local/heroku/bin:$PATH"
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env
export GOPATH="$HOME/.gopath"
export PATH="$GOPATH/bin:$PATH"
[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ] && \. "$HOME/.sdkman/bin/sdkman-init.sh"  # This loads sdkman
