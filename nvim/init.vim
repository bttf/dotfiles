call plug#begin('~/.local/share/nvim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/matchit.zip'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'bling/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-surround'
Plug 'Quramy/tsuquyomi'
Plug 'altercation/vim-colors-solarized'
Plug 'heavenshell/vim-jsdoc'
Plug 'elixir-lang/vim-elixir'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/vimproc.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'chriskempson/tomorrow-theme'
Plug 'jparise/vim-graphql'
Plug 'w0rp/ale'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'ianks/vim-tsx'
Plug 'fatih/vim-go'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'grvcoelho/vim-javascript-snippets'
Plug 'roxma/nvim-completion-manager'
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }
call plug#end()

syntax on
colorscheme desert
filetype plugin indent on
set nu
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

set directory=~/.local/share/nvim/_tmp//
set backupdir=~/.local/share/nvim/backup//
set undodir=~/.local/share/nvim/_tmp
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

" mappings
let mapleader='-'
let maplocalleader='\\'
inoremap jk <esc>
nnoremap <leader>q :q<cr>
nnoremap <leader>t :NERDTree<cr>
nnoremap <leader>f :NERDTreeFind<cr>
nnoremap <leader>p :set paste!<cr>
nnoremap <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <leader>ev :vsp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
imap <C-y>- <Plug>snipMateTrigger

set relativenumber

" wildmenu
set wildmenu
set wildmode=full

" automatically equalize splits when Vim is resized
augroup on_resize
  autocmd!
  autocmd VimResized * wincmd =
augroup END

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
  \   'html': [],
  \ }

" fix highlight colors
:hi Error ctermfg=0
:hi ErrorMsg ctermfg=0

let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

" lsp plugin
let $LANGUAGECLIENT_DEBUG=1
let g:LanguageClient_loggingLevel='DEBUG'
let g:LanguageClient_serverCommands = {
\ 'javascript.jsx': ['flow-language-server', '--stdio'],
\ }
let g:LanguageClient_autoStart=1
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>

" nvim-completion-manager
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
