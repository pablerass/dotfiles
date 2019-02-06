# Outputs current aws-vault profile in prompt format
function aws_vault_prompt_info() {
  if [[ -z ${AWS_VAULT+x} ]]; then return; fi
  echo "$ZSH_THEME_AWS_VAULT_PROMPT_PREFIX$AWS_VAULT$ZSH_THEME_AWS_VAULT_PROMPT_SUFFIX"
}