if [[ $? -eq 0 ]] && ! type workon &>/dev/null; then
  print "[oh-my-zsh] myrtualenvwrapper plugin: shell function 'workon' not defined.\n"
        "Please review pyenv virtualenvwrapper execution" >&2
  return
fi

if [[ -z "$WORKON_HOME" ]]; then
  WORKON_HOME="$HOME/.virtualenvs"
fi

function workon_cwd {
  if [[ -z "$WORKON_CWD" ]]; then
    local WORKON_CWD=1
    # Get absolute path, resolving symlinks
    local PROJECT_ROOT="${PWD:A}"
    while [[ "$PROJECT_ROOT" != "/" && ! -e "$PROJECT_ROOT/.venv" \
        && ! -d "$PROJECT_ROOT/.git" ]]; do
      PROJECT_ROOT="${PROJECT_ROOT:h}"
    done

    # Check for virtualenv name override
    if [[ -f "$PROJECT_ROOT/.venv" ]]; then
      ENV_NAME="$(cat "$PROJECT_ROOT/.venv")"
    elif [[ -f "$PROJECT_ROOT/.venv/bin/activate" ]];then
      ENV_NAME="$PROJECT_ROOT/.venv"
    elif [[ "$PROJECT_ROOT" != "/" ]]; then
      ENV_NAME="${PROJECT_ROOT:t}"
    else
      ENV_NAME=""
    fi

    if [[ "$MYRTUALENVWRAPPER_FIRST" == "" ]]; then
      # TODO: Solve the issue instead of ignore it
      MYRTUALENVWRAPPER_FIRST=1
      if [[ "$ENV_NAME" != "" ]]; then
          export CD_VIRTUAL_ENV="$ENV_NAME"
      fi
      return
    fi

    if [[ -n "$CD_VIRTUAL_ENV" && "$ENV_NAME" != "$CD_VIRTUAL_ENV" ]]; then
      # We've just left the repo, deactivate the environment
      # Note: this only happens if the virtualenv was activated automatically
      if [[ -n "$VIRTUAL_ENV" ]]; then
        # Only deactivate if VIRTUAL_ENV was set
        # User may have deactivated manually or via another mechanism
        deactivate
      fi
      # clean up regardless
      unset CD_VIRTUAL_ENV
    fi

    if [[ "$ENV_NAME" != "" ]]; then
      # Activate the environment only if it is not already active
      if [[ ! "$VIRTUAL_ENV" -ef "$WORKON_HOME/$ENV_NAME" ]]; then
        if [[ -e "$WORKON_HOME/$ENV_NAME/bin/activate" ]]; then
          workon "$ENV_NAME" && export CD_VIRTUAL_ENV="$ENV_NAME"
        elif [[ -e "$ENV_NAME/bin/activate" ]]; then
          source $ENV_NAME/bin/activate && export CD_VIRTUAL_ENV="$ENV_NAME"
        else
          ENV_NAME=""
        fi
      fi
    fi

    if [[ "$ENV_NAME" == "" && "$CD_VIRTUAL_ENV" && -n "$VIRTUAL_ENV" ]]; then
      # We've just left the repo, deactivate the environment
      # Note: this only happens if the virtualenv was activated automatically
      deactivate && unset CD_VIRTUAL_ENV
    fi
  fi
}

# Append workon_cwd to the chpwd_functions array, so it will be called on cd
# http://zsh.sourceforge.net/Doc/Release/Functions.html
autoload -U add-zsh-hook
add-zsh-hook chpwd workon_cwd
if [[ $PWD != ~ ]]; then
    workon_cwd
fi
