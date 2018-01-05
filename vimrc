" Vundle Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required
set colorcolumn=80
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'godlygeek/tabular'
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-surround'
Plugin 'Quramy/tsuquyomi'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'elixir-lang/vim-elixir'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/vimproc.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'chriskempson/tomorrow-theme'
Plugin 'jparise/vim-graphql'
Plugin 'w0rp/ale'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
call vundle#end()
" End Vundle Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
colorscheme Tomorrow-Night
filetype plugin indent on
set nu
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

set directory=~/.vim/_tmp//
set backupdir=~/.vim/backup//
set undodir=~/.vim/_tmp
set undofile

" fix airline issues
set laststatus=2

" ctrlP config
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*/node_modules/*,*/bower_components/*
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" custom commands
nnoremap <leader>t :NERDTree<cr>
nnoremap <leader>f :NERDTreeFind<cr>
nnoremap <leader>p :set paste!<cr>
nnoremap <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

set relativenumber

" wildmenu
set wildmenu
set wildmode=full

" automatically equalize splits when Vim is resized
autocmd VimResized * wincmd =

" highlight current line
set cursorline

" no need to redraw during macros
set lazyredraw

" vim-jsx
let g:jsx_ext_required = 0

" ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linters = {
\ 'jsx': ['eslint'],
\ 'html': [],
\}

" fix highlight colors
:hi Error ctermfg=0
:hi ErrorMsg ctermfg=0
