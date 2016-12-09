# Settings
autoload -Uz compinit 
compinit -u

autoload -Uz colors
colors

bindkey -v

# Ruby
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
