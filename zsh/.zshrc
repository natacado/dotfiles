if [[ -r $HOME/.antigen/antigen/antigen.zsh ]]; then
  source $HOME/.antigen/antigen/antigen.zsh
elif [[ -r /usr/local/share/antigen/antigen.zsh ]]; then
  source /usr/local/share/antigen/antigen.zsh
else
  echo "WARNING: Cannot find antigen. Shell config missing many niceties"
fi

if [ -d "$LOCAL_ADMIN_SCRIPTS" ]; then
  source "$LOCAL_ADMIN_SCRIPTS"/master.zshrc
fi


# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle extract
antigen bundle zsh-users/zsh-syntax-highlighting

if [[ $(uname) == 'Darwin' ]]; then
  antigen bundle brew
  antigen bundle brew-cask
  antigen bundle osx

  # Homebrew caveat to enable online help
  if [[ $SHELL == '/usr/local/bin/zsh' ]]; then
    unalias run-help
    autoload run-help
    HELPDIR=/usr/local/share/zsh/help
  fi

  # iTerm2 integration
  [ -e "${HOME}/.iterm2_shell_integration.zsh" ] && source "${HOME}/.iterm2_shell_integration.zsh"
fi

# Load the theme.
antigen theme $HOME/.zsh/themes clean

# Tell Antigen that you're done.
antigen apply

# Support for case-insensitive glob; eg rdm alias
setopt extendedglob
setopt print_exit_value
setopt auto_cd
setopt auto_pushd
setopt pushd_to_home
setopt correct
setopt dvorak               # Hint that I use dvorak for spelling corrections
setopt inc_append_history   # Immediately append commands to history
setopt prompt_subst         # Enable prompt variable expansion
setopt rm_star_silent       # Don't warn about deleting with * globs
setopt complete_in_word     # Allow tab completion in middle of a word
setopt hist_ignore_space    # Don't record commands starting with initial space
setopt no_beep              # No noise. Noise bad.

# Prompt formatting
autoload -U colors && colors

# Make Ctrl+Left and Ctrl+Right jump between words. This used to work out of the
# box but broke around January 2018 for some reason...
# https://unix.stackexchange.com/a/167045
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '\e.' insert-last-word

if type vimpager > /dev/null; then
export PAGER=vimpager
elif type most > /dev/null; then
export PAGER=most
else
export PAGER='less -FS'
fi
alias less=$PAGER
alias zless=$PAGER

export EDITOR=vim
if [ -d $HOME/bin ]; then
  PATH=$PATH:$HOME/bin
fi
if [ -d $HOME/bin/override ]; then
  export PATH=$HOME/bin/override:$PATH
fi

# Command history settings
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE="${HOME}/.zsh_history"

# Show how long a command took if it exceeded this (in seconds)
export REPORTTIME=10

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -d $HOME/.zsh/zshrc.d ]; then
  for file in $HOME/.zsh/zshrc.d/*.zsh; do
    source $file
  done
fi
