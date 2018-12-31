if [[ $(uname -s) == "Linux" ]]; then
  alias ls='ls -CFa --color=auto'
  export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'
  alias df='df -Ht'
  alias psc='ps xawf -eo pid,user,cgroup,args'
elif [[ $(uname -s) == "Darwin" ]]; then
  export CLICOLOR=1
  export LSCOLORS="Gxfxcxdxbxegedabagacad"
  alias ls='ls -CFa'
  alias df='df -H'
fi
alias l='ls -a'
alias la='ls -la'
alias ll='ls -l'
alias p=pushd
alias o=popd
alias grep='grep --color=auto'
alias rdm='$PAGER *(#i)(README)*'

curlpp() { curl ${@[1,-2]} "http://www.paulparadise.com${@[-1]}" }
curlmonica() { curl ${@[1,-2]} "https://monica.pa.radis.es${@[-1]}" }
curllinks() { curl ${@[1,-2]} "http://links.paulparadise.com${@[-1]}" }

# http://www.brianstorti.com/stop-using-tail/
# less +F is superior to tail -f when tailing a single file, but I don't want
# to change my finger memory.
# Ctrl-C to use less functionality, F to go back to tailing.
tail() {
  local use_less=false
  if (( $# == 2 )); then
    if [[ $1 -eq "-f" ]] then
      use_less=true
    fi
  fi

  if [[ "$use_less" == "true" ]]; then
    less +F $2
  else
    command tail $@
  fi
}
sortiq() { sort | uniq -c | sort -rn ; }

# Mercurial (hg)
hgrel() { realpath --relative-to=$(hg root) "$@"; }
if type hg-sl-up > /dev/null; then
  alias sl='hg-sl-up -- --quiet'
fi

# Make directory and cd into it
mkcd() { mkdir -p "$@" && cd "$_"; }
TMPDIR=${TMPDIR:=/tmp}
alias cdtmp='cd $(mktemp -d $TMPDIR/$USER-XXXXXX)'

# CD to root of repo
cdr() {
  git rev-parse --git-dir > /dev/null 2>&1 && {
    cd $(git rev-parse --show-toplevel);
    return;
  }

  hg_root=$(hg root 2>/dev/null) && {
    cd "$hg_root";
    return;
  }

  return 255
}

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

if type gdb > /dev/null; then
  alias gdbr='gdb -ex run -args'
fi

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

