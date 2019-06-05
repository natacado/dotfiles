_set_prompt() {
  NCOLOR="green"
  HOSTHINT=" p"
  if [[ -d /opt/facebook/CPE ]]; then
    NCOLOR="cyan"
    HOSTHINT=" f"
  elif [[ $(hostname -f) =~ "facebook.com$" ]]; then
    NCOLOR="blue"
    HOSTHINT=" f"
  fi
  if [ $UID -eq 0 ]; then 
    NCOLOR="red" 
  fi

  export PROMPT='%{$bg[$NCOLOR]%}%{$fg_bold[white]%}${HOSTHINT}%{$reset_color%} %{$fg[blue]%}%B%c/%b%{$reset_color%} $(_scm_prompt)%(!.#.$) '
}
_set_prompt

# Put the running time of the last command in the right prompt
# Adapted slightly from https://coderwall.com/p/kmchbw/zsh-display-commands-runtime-in-prompt
function preexec() {
  cmdtimer=${cmdtimer:-$SECONDS}
  _cmd="$1"
}
function precmd() {
  if [ $cmdtimer ]; then
    timer_show=$((SECONDS - cmdtimer))
    export RPROMPT="%F{cyan}${timer_show}s %{$reset_color%}[%*]"
    unset cmdtimer
  else
    export RPROMPT='[%*]'
  fi
}
RPROMPT='[%*]'

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg_no_bold[yellow]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[blue]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✗"
