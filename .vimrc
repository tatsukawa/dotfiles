" Vi互換モードをoff
set nocompatible

" NeoBundle Settings {{{
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc'

" My Bundles here:
NeoBundle 'thinca/vim-quickrun'
"NeoBundle 'jonathanfilip/vim-lucius'
"NeoBundle 'tomasr/molokai'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'alpaca-tc/alpaca_powertabline'
"NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'bling/vim-airline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/syntastic'

filetype plugin indent on     " Required!

" Installation check.
NeoBundleCheck
"}}}

" Standard Settings {{{
" コマンドライン補完
set wildmenu

" タイプ途中のコマンドを画面下に表示
set showcmd

" 検索語を強調表示
set hlsearch

" スワップファイル、バックアップファイルを取らない
set nowritebackup
set nobackup
set noswapfile

" 不可視文字の可視化
set list

" Unicodeで更かし文字を綺麗に表示
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲

" 自動的に改行が入るのを無効化
set textwidth=0

" クリップボードの設定
set clipboard+=unnamed
set clipboard+=autoselect

" 自動インデント
set autoindent

" カーソルが何行目の何列目に置かれているかを表示
set ruler

" 常にステータス行を表示
set laststatus=2

" {command} を実行する際、確認が必要ならばダイアログを表示
set confirm

" 削除
set backspace=indent,eol,start

" 行番号
set number

" 80列目に線入れる
set colorcolumn=80

" マーカー埋め込みによる折り畳み機能
set foldmethod=marker

" インデント類の設定
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftwidth=4
set tabstop=4

" () highlight
set showmatch

" 色数
set t_Co=256

" カラースキーマ
colorscheme hybrid

" カーソル行をハイライト
set cursorline

" カレントウィンドウにのみ罫線を引く
augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorline
    autocmd WinEnter,BufRead * set cursorline
augroup END

hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" 文字エンコーディング
set encoding=utf-8

" Vimを使ってくれてありがとう！！！！！！！！！！！！
set notitle

" ;でコマンド入力( ;と:を入れ替) (Mac or linux)
if !has('win32')
    noremap ; :
endif

" Anywhere SID.
function! s:SID_PREFIX()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()
    let s = ''
    for i in range(1, tabpagenr('$'))
        let bufnrs = tabpagebuflist(i)
        let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
        let no = i  " display 0-origin tabpagenr.
        let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
        let title = fnamemodify(bufname(bufnr), ':t')
        let title = '[' . title . ']'
        let s .= '%'.i.'T'
        let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
        let s .= no . ':' . title
        let s .= mod
        let s .= '%#TabLineFill# '
    endfor
    let s .= '%#TabLineFill#%T%=%#TabLine#'
    return s
endfunction
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'

" タブ設定
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t   [Tag]
" Tab jump
" t1で一番左のTab, ...
for n in range(1, tabpagenr('$') - 1)
    execute 'nnoremap <silent> [Tag]'.n ':<C-u>tabnext'.n.'<CR>'
endfor
" Key mapping
map <silent> [Tag]o :tablast <bar> tabnew<CR>
map <silent> [Tag]d :tabclose<CR>
map <silent> [Tag]n :tabnext<CR>
map <silent> [Tag]p :tabprevious<CR>
"}}}

" Plugin Settings {{{
" Airline 
let g:airline_powerline_fonts = 1
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline#extensions#branch#symbol = '⭠'
let g:airline#extensions#readonly#symbol = '⭤'
let g:airline_linecolumn_prefix = '⭡'

" Quickrun 
" clang のコマンドラインオプションを追加する
if executable("clang++")
    let g:quickrun_config = {}
    let g:quickrun_config['cpp/clang++11'] = {
                \ 'cmdopt': '--std=c++11 --stdlib=libc++',
                \ 'type': 'cpp/clang++',
                \ 'hook/time/enable': '1'
                \ }
    let g:quickrun_config['cpp'] = {'type': 'cpp/clang++11'}
endif

" Syntastic
" エラー表示
let g:syntastic_auto_loc_list = 1
" clang用
if executable("clang++")
    let g:syntastic_cpp_compiler = 'clang++'
    let g:syntastic_cpp_compiler_options = '--std=c++11 --stdlib=libc++'
endif
" error箇所の文字
let g:syntastic_error_symbol='⚠'

" Alpaca_Powertabline
let g:alpaca_powertabline_enable = 1
let g:alpaca_powertabline_sep1 = "⮀"
let g:alpaca_powertabline_sep2 = "⮁"
let g:alpaca_powertabline_default_place = 1
"}}}
