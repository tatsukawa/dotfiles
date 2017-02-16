# Settings
autoload -Uz compinit 
compinit -u

autoload -Uz colors
colors

bindkey -v

# History
export HISTFILE=${HOME}/.zhistory
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt hist_reduce_blanks  
setopt hist_save_no_dups
setopt hist_no_store
setopt hist_expand
setopt inc_append_history
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

#Ruby
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

# Python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# golang
export GOPATH="$HOME/.go"
export PATH=$PATH:$HOME/.go/bin

# added by travis gem
[ -f /home/tatsukawa/.travis/travis.sh ] && source /home/tatsukawa/.travis/travis.sh
