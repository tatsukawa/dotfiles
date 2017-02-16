source $HOME/.zplug/init.zsh

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"
zplug "mollifier/cd-gitroot"
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
zplug "mrowa44/emojify", as:command
zplug "b4b4r07/emoji-cli", if:"which jq"
zplug "b4b4r07/enhancd", use:init.sh
zplug "b4b4r07/zsh-gomi", as:command, use:bin
zplug "themes/frisk", from:oh-my-zsh, as:theme

zplug "~/.zsh", from:local

if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load --verbose

source $HOME/.zlogin
