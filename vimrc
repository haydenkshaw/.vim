set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set guifont=Monospace

execute pathogen#infect()
syntax on
filetype plugin indent on

set number
set ruler

set runtimepath^=~/.vim/bundle/ctrlp.vim
au BufNewFile,BufRead *.ejs set filetype=html
set nowrap
