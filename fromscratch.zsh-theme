### left hand prompt
#
# only show user@host, when connected via ssh or inside docker container
USER_HOST=""
[ "$SSH_CLIENT" ] || [ "$(grep docker /proc/1/cgroup 2>/dev/null)" ] && USER_HOST='%n@%m:'
# color of current directory changes, when the shell is running with privileges
PROMPT="$USER_HOST%(!.%{$fg[red]%}.%{$fg[yellow]%})%~%{$reset_color%}%(!.#.>) "

### right hand prompt
#
# show the last return code, when it was not 0
PROMPT_RETURN_CODE="%(?..%{$fg_bold[red]%}%?%{$reset_color%})"
# configuration for git_prompt_info
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
# indicate a dirty branch with color change
git_prompt_color() {
  if [ $(git_prompt_info | grep "$ZSH_THEME_GIT_PROMPT_DIRTY") ]; then
    echo "%{$fg[magenta]%}"
  else
    echo "%{$fg[yellow]%}"
  fi
}
RPROMPT='$PROMPT_RETURN_CODE $(git_prompt_color)$(git_prompt_info)%{$reset_color%}'
