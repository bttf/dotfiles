execute pathogen#infect()
syntax on
filetype plugin indent on
set nu
colorscheme desert
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

set directory=~/.vim/_tmp//
set backupdir=~/.vim/backup//

" ctrlP config
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*/node_modules/*,*/bower_components/*
