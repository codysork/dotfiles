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
" NEOBUNDLE
"
" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
"
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
if !has('nvim')
      NeoBundle 'rhysd/vim-healthcheck'
    endif

call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"
" VUNDLE
"
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()            " required

" My installed plugins
Plugin 'gerw/vim-latex-suite'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'sheerun/vim-polyglot'
Plugin 'dense-analysis/ale'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-vdebug/vdebug'

" My Plugin Settings
filetype plugin on

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
