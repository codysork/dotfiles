" .vimrc
" 
" Cody Sork's configuration 2020
" ------------------------------

" Required Settings
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif
filetype off                  " required
if &compatible
      set nocompatible               " Be iMproved
endif

filetype indent plugin on     " required
filetype indent on

"
" Preferred Settings
"
set backspace=indent,eol,start
set clipboard=unnamed
set cmdheight=2 " more space for displaying messages
set expandtab

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

set incsearch
set number
set softtabstop=2
set shiftwidth=2
set showcmd
set wildmenu
syntax on
