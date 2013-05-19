if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

" My Bundles here:
"
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'Lokaltog/vim-powerline'
"NeoBundle 'Lokaltog/powerline'
NeoBundle 'tomasr/molokai'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'scrooloose/syntastic'
" NeoBundle 'errormarker.vim'

filetype plugin indent on     " Required!

NeoBundleCheck


