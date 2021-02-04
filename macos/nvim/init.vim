syntax on
filetype plugin indent on

set nu
set relativenumber
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set autoindent
set undofile
set directory=~/.local/share/nvim/_tmp
set backupdir=~/.local/share/nvim/backup
set undodir=~/.local/share/nvim/_tmp
set laststatus=2
set wildmenu
set wildmode=full
set lazyredraw
set cursorline
set winminwidth=20
set winwidth=80
set colorcolumn=80

if has("termguicolors")
  set termguicolors
endif

" ctrlP config
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/__generated__/*     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
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
" imap <C-y>- <Plug>snipMateTrigger
nnoremap <leader>r :tabn<cr>
nnoremap <leader>R :tabp<cr>
nnoremap <leader>> 20<C-w>><cr>
nnoremap <leader>< 20<C-w><<cr>
nnoremap <leader>a :Ack!<Space>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>d <C-d>
nnoremap <leader>u <C-u>
nnoremap <Tab>d <C-d>
nnoremap <Tab>u <C-u>
nnoremap <silent> <leader>cp :let @+ = expand("%")<CR>
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <C-f> "hy:Ack! <C-r>h

" automatically equalize splits when Vim is resized
augroup on_resize
  autocmd!
  autocmd VimResized * wincmd =
augroup END

" vim-jsx
let g:jsx_ext_required = 0

" ale
" only lint when file is saved
let g:ale_lint_on_text_changed = 'never'
" dont lint on opening a file
let g:ale_lint_on_enter = 0
" disable html linting
let g:ale_linters_ignore = ['tsserver', 'tslint']
let g:ale_linters = {
  \   'html': [],
  \ }

" vim-javascript
" flow syntax highlighting
let g:javascript_plugin_flow = 1

" emmet-vim
" enable for jsx
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

" lsp plugin
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
cnoreabbrev ag Ack!
cnoreabbrev aG Ack!
cnoreabbrev Ag Ack!
cnoreabbrev AG Ack!

" snippets config
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-y>-"

" youcompleteme disables filepath for jsx files by default
let g:ycm_filepath_blacklist = {}

" vim-illuminate config
let g:Illuminate_delay = 0

" smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

call plug#begin('~/.local/share/nvim/plugged')
Plug 'chriskempson/base16-vim'

Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'w0rp/ale'
Plug 'mileszs/ack.vim'
" Plug 'vim-scripts/matchit.zip'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'Quramy/vim-js-pretty-template'
Plug 'elzr/vim-json'
Plug 'jparise/vim-graphql'

" scss
Plug 'cakebaker/scss-syntax.vim'

" autocomplete
Plug 'Valloric/YouCompleteMe'

Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

" elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

" typescript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'ianks/vim-tsx'

" vue
Plug 'posva/vim-vue'

Plug 'mhinz/vim-startify'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" color hex codes
Plug 'lilydjwg/colorizer'

" color nested blocks
" Note: doesn't work with vim-javascript
" Plug 'luochen1990/rainbow'

" highlight word instances on hover
Plug 'RRethy/vim-illuminate'

" smooth scroll
Plug 'terryma/vim-smooth-scroll'

call plug#end()

colorscheme base16-ia-dark
