# Setup Oh My ZSH
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="mycandy"

# Configure pyenv
if [[ -d "$HOME/.pyenv" ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"

    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
    pyenv virtualenvwrapper_lazy
fi

plugins=(z gnu-utils systemadmin systemd man rsync \
    tmux tmuxinator git \
    vagrant terraform terragrunt \
    aws awsume awless s3cmd gcloud \
    docker docker-compose virsh \
    pip pipenv httpie pyenv \
    node npm nvm bower yarn grunt gulp \
    ruby gem rbenv rvm rake \
    ansible \
    mvn ant gradle sdk golang glide \
    kubectl minikube kops helm eksctl \
    zsh-completions \
    myrtualenvwrapper)
source $ZSH/oh-my-zsh.sh

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

# Tools variables
export PATH="/usr/local/heroku/bin:$PATH"
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env
export GOPATH="$HOME/.gopath"
export PATH="$GOPATH/bin:$PATH"
[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ] && \. "$HOME/.sdkman/bin/sdkman-init.sh"  # This loads sdkman

if [ -f "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
