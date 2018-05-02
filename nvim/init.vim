" muh plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'

Plug 'w0rp/ale'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'

Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'

Plug 'pangloss/vim-javascript'
Plug 'mustache/vim-mustache-handlebars'
Plug 'heavenshell/vim-jsdoc'
Plug 'mxw/vim-jsx'
Plug 'Quramy/vim-js-pretty-template'
Plug 'elzr/vim-json'

Plug 'elixir-lang/vim-elixir'

Plug 'jparise/vim-graphql'

Plug 'fatih/vim-go'

" snipmate and its dependencies
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
colorscheme base16-default-dark
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
nnoremap <leader>w :w<cr>
nnoremap <leader>t :NERDTree<cr>
nnoremap <leader>f :NERDTreeFind<cr>
nnoremap <leader>p :set paste!<cr>
nnoremap <leader><space> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <leader>ev :vsp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
imap <C-y>- <Plug>snipMateTrigger
nnoremap <leader>e :tabn<cr>
nnoremap <leader>E :tabp<cr>
nnoremap <leader>> 20<C-w>><cr>
nnoremap <leader>< 20<C-w><<cr>

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

" vim-javascript
let g:javascript_plugin_flow = 1

let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

" lsp plugin
" let $LANGUAGECLIENT_DEBUG=1
" let g:LanguageClient_loggingLevel='DEBUG'
let g:LanguageClient_serverCommands = {
\ 'javascript.jsx': ['flow-language-server', '--stdio'],
\ }
let g:LanguageClient_autoStart=1
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>

" nvim-completion-manager
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ack.vim config to use ag
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" javascript code folding
" augroup javascript_folding
"   au!
"   au FileType javascript setlocal foldmethod=syntax
"   au FileType javascript.jsx normal zR
" augroup END
