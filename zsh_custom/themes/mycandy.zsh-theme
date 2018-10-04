# Outputs current aws-vault profile in prompt format
function aws_vault_prompt_info() {
  if [[ -z ${AWS_VAULT+x} ]]; then return; fi
  echo "$ZSH_THEME_AWS_VAULT_PROMPT_PREFIX$AWS_VAULT$ZSH_THEME_AWS_VAULT_PROMPT_SUFFIX"
}

PROMPT=$'%{$fg_bold[green]%}%n@%m %{$fg[blue]%}%D{[%X]} %{$reset_color%}%{$fg[white]%}[%~]%{$reset_color%} $(aws_vault_prompt_info)\$(git_prompt_info)\
%{$fg[blue]%}->%{$fg_bold[blue]%} %#%{$reset_color%} '

ZSH_THEME_AWS_VAULT_PROMPT_PREFIX="%{$fg[red]%}("
ZSH_THEME_AWS_VAULT_PROMPT_SUFFIX=")%{$reset_color%} "

ZSH_THEME_NVM_PROMPT_PREFIX="%{$fg[blue]%}("
ZSH_THEME_NVM_PROMPT_SUFFIX=")%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""