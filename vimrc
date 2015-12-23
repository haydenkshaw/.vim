" Vim syntax file

" Enable pathogen bundles
execute pathogen#infect()
execute pathogen#helptags()

" Vimcasts #24
" Auto-reload vimrc on save
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
    filetype plugin indent on
endif


" Tabstops of 4, and prefer spaces to tabs. Text width 80 and wrapping
" My dark default background and syntax highlighting.
:set nocompatible
:set encoding=utf-8
:set expandtab
:set textwidth=80
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set number
:set background=dark
:syntax on
:set tags=$HOME/.vim/doc/tags
:set ttyfast
:set showcmd
:set showmode
:set wildmenu
:set wildmode=list:longest
:set undofile
:set splitbelow
:set splitright


" Added based on http://www.perlmonks.org/index.pl?node_id=441738
:set smarttab
:set shiftround
:set autoindent
:set smartindent

" Highlight Searches
:set hlsearch
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" 2-space tab-width for HTML, CSS, JS and Ruby
:autocmd FileType html set shiftwidth=2 tabstop=2 softtabstop=2
:autocmd FileType css set shiftwidth=2 tabstop=2 softtabstop=2
:autocmd FileType js set shiftwidth=2 tabstop=2 softtabstop=2
:autocmd FileType ruby set shiftwidth=2 tabstop=2 softtabstop=2

" PHP syntax settings and options
:let php_sql_query=1
:let php_htmlInStrings=1
:let php_folding=1
:let php_parent_error_close=1
:let php_parent_error_open=1
":function! PhpDocLoad()
":   so $HOME/.vim/php-doc.vim
":   inoremap <C-P><ESC> :call PhpDocSingle()<CR>i
":   nnoremap <C-P> :call PhpDocSingle()<CR>
":   vnoremap <C-P> :call PhpDocRange()<CR>
":   inoremap ( ()<Left>
":endfunction
":autocmd BufNewFile,BufRead *.php call PhpDocLoad()

" PHP parser check (CTRL-L)
:autocmd FileType php noremap <C-L> :w!<CR>:!php -l %<CR>

" Run file with PHP CLI (CTRL-M)
:autocmd FileType php noremap <C-M> :w!<CR>:!php %<CR>

" 2-space tab-width for JS
:autocmd FileType javascript set shiftwidth=2 tabstop=2 softtabstop=2

" Show info in ruler
set laststatus=2

" phpcomplete.vim settings
let g:phpcomplete_complete_for_unkonwn_classes = 1
let g:phpcomplete_min_num_of_chars_for_namespace_completion = 1
let g:phpcomplete_parse_docblock_comments = 1
let g:phpcomplete_cache_taglists = 1
let g:phpcomplete_enhance_jump_to_definition = 1
let g:phpcomplete_mappings =
    \ {
    \     'jump_to_def': ',g',
    \     'jump_to_def_split': '<C-]>',
    \     'jump_to_def_vsplit': '<C-W><C-]>',
    \ }

" The escape key is a long ways away. This maps it to the sequence 'jf'
:map! jf <Esc>
:inoremap jf <Esc>

" vim-phpqa settings
" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0

" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0

" Show code coverage on load (default = 0)
let g:phpqa_codecoverage_autorun = 0
