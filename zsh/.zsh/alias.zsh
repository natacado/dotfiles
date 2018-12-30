if [[ $(uname -s) == "Linux" ]]; then
  alias ls='ls --color=auto'
  alias df='df -Ht'
elif [[ $(uname -s) == "Darwin" ]]; then
  export CLICOLOR=1
  alias df='df -H'
fi
alias la='ls -la'
alias ll='ls -l'
alias grep='grep --color=auto'
alias rdm='$PAGER *(#i)(README)*'

curlpp() { curl ${@[1,-2]} "http://www.paulparadise.com${@[-1]}" }
curlmonica() { curl ${@[1,-2]} "https://monica.pa.radis.es${@[-1]}" }
curllinks() { curl ${@[1,-2]} "http://links.paulparadise.com${@[-1]}" }

# Make directory and cd into it
mkcd() { mkdir -p "$@" && cd "$_"; }

# "p" as in "print". Delegates to `ls` for folders and `less` for files
p() {
  local p="${1:-.}"
  if [[ -f "$p" ]]; then
    $PAGER "$p"
  else
    ll "$p"
  fi
}

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

if [[ $(uname -s) == "Linux" ]]; then
  alias -g CA="2>&1 | cat -A"
elif [[ $(uname -s) == "Darwin" ]]; then
  alias -g CA="2>&1 | cat -et"
fi
alias -g C='| wc -l'
alias -g DN=/dev/null
alias -g EG='|& egrep'
alias -g EH='|& head'
alias -g EL='|& $PAGER'
alias -g ELF='|& less +F'
alias -g ETL='|& tail -20'
alias -g ET='|& tail'
alias -g ET='|& tail -f'
alias -g F=' | fmt -'
alias -g G='| egrep'
alias -g H='| head'
alias -g HL='|& head -20'
alias -g Sk="*~(*.bz2|*.gz|*.tgz|*.zip|*.z)"
alias -g LL="2>&1 | $PAGER"
alias -g LF="| less +F"
alias -g L="| $PAGER"
if type most > /dev/null; then
  alias -g MM='| most'
fi
alias -g M='| more'
alias -g NE="2> /dev/null"
alias -g S='| sort'
alias -g NS='| sort -n'
alias -g RNS='| sort -nr'
alias -g NUL="> /dev/null 2>&1"
alias -g TL='| tail -20'
alias -g T='| tail'
alias -g US='| sort -u'
alias -g VM=/var/log/messages
alias -g X0G='| xargs -0 egrep'
alias -g X0='| xargs -0'
alias -g XG='| xargs egrep'
alias -g X='| xargs'

# Default programs - "run" the file, open in editor
alias -s c='$EDITOR'
alias -s conf='$EDITOR'
alias -s cpp='$EDITOR'
alias -s css='$EDITOR'
alias -s h='$EDITOR'
alias -s hpp='$EDITOR'
alias -s hs='$EDITOR'
alias -s html='$EDITOR'
alias -s js='$EDITOR'
alias -s md='$EDITOR'
alias -s pdf='open'
alias -s php='$EDITOR'
alias -s rb='$EDITOR'
alias -s sass='$EDITOR'
alias -s scss='$EDITOR'
alias -s tex='$EDITOR'
alias -s txt='$EDITOR'
alias -s xml='$EDITOR'
alias -s zsh='$EDITOR'

