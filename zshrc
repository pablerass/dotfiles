# Setup Oh My ZSH
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="mycandy"

# Load nvm on first use of node, npm or nvm to speed up shell startup
zstyle ':omz:plugins:nvm' lazy yes

plugins=(z gnu-utils systemadmin systemd man rsync \
    sudo extract colored-man-pages copypath copyfile copybuffer fzf \
    tmux tmuxinator git gh \
    vagrant terraform terragrunt \
    aws awsume s3cmd \
    docker docker-compose \
    pip uv ruff httpie \
    node npm nvm \
    rust \
    ansible \
    mvn ant sdk \
    golang \
    kubectl minikube helm \
    zsh-completions zsh-autosuggestions \
    zsh-syntax-highlighting)  # Must be the last plugin
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
(( $+commands[ty] )) && eval "$(ty generate-shell-completion zsh)"  # No oh-my-zsh plugin for ty yet

if [ -f "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
