"文字コードと改行コードの設定
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8, cp932, sjis, utf-161e
set fileformats=dos, unix

syntax enable "構文ハイライトをオン
filetype plugin indent on

colorscheme slate "カラースキーム
set laststatus=2
set ruler
set showmode
set showcmd
set number
set hidden
set wildmenu
set iminsert=0
set hlsearch
set autoindent

set noundofile
set nobackup
set noswapfile
set viminfo=

set shiftwidth=0 softtabstop=0 tabstop=4 expandtab
let g:vim_indent_cont=8
set textwidth=0

augroup vimrc
	autocmd!
	autocmd FileType vim setlocal keywordprg:help
rg=:help
augroup END
