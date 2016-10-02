autoload -Uz compinit 
compinit -u

source $HOME/.zplug/init.zsh

zplug "themes/frisk", from:oh-my-zsh

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

zplug "~/.zsh", from:local

if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load --verbose
