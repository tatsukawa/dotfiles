set nocompatible               " Be iMproved

source $HOME/.vim/rc/.neobundle.vim	" NeoBundle
source $HOME/.vim/rc/.display.vim	
source $HOME/.vim/rc/.editor.vim
source $HOME/.vim/rc/.color.vim
source $HOME/.vim/rc/.option.vim
source $HOME/.vim/rc/.pluginsetting.vim

autocmd BufNewFile  *.cpp	0r ~/.vim/skeleton.cpp
