" Environment {

    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible        " Must be first line
        if !WINDOWS()
            set shell=/bin/sh
        endif
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if WINDOWS()
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }

    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif
    
" From http://vim.wikia.com/wiki/Hide_toolbar_or_menus_to_see_more_text
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

" Enable pathogen bundles
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()

" Auto reload vimrc on save for all buffers
" http://stackoverflow.com/questions/4158277/automatically-reload-vimrc-edited-in-a-vim-session-in-an-already-opened-gvim-in
function! UpdateVimRC()
    for server in split(serverlist())
        call remote_send(server, '<Esc>:source $HOME/.vimrc<CR>')
    endfor
endfunction
augroup myvimrchooks
au!
    autocmd bufwritepost vimrc call UpdateVimRC()
augroup END

" better backup, swap and undos storage
" https://gist.github.com/matagus/3e62179965ded5ce762d
" set directory=~/.vim/temp/swap " directory to place swap files in
" set backup " make backup files
" set backupdir=~/.vim/temp/backups " where to put backup files
" set undofile " persistent undos - undo after you re-open the file
" set undodir=~/.vim/temp/undos

" Make backspace work on Windows http://stackoverflow.com/questions/5419848/backspace-doesnt-work-in-gvim-7-2-64-bit-for-windows
set backspace=2
set backspace=indent,eol,start

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
":set guifont=Menia
set guifont=Monaco:h12

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
:autocmd FileType jsx set shiftwidth=2 tabstop=2 softtabstop=2
:autocmd FileType ruby set shiftwidth=2 tabstop=2 softtabstop=2

" The escape key is a long ways away. This maps it to the sequence 'jf'
:map! jf <Esc>
:inoremap jf <Esc>

" NERDTree {
    autocmd vimenter * NERDTree
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    let NERDTreeQuitOnOpen=0
    let NERDTreeMouseMode=2

    function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
     exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
     exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
    endfunction
    
    " JavaScript and derivates
    call NERDTreeHighlightFile('coffee', 'Green', 'none', 'green', '#02023E')
    call NERDTreeHighlightFile('js', 'Green', 'none', 'green', '#02023E')
    call NERDTreeHighlightFile('jsx', 'Green', 'none', 'green', '#02023E')
    " PHP
    call NERDTreeHighlightFile('php', 'blue', 'none', '#3366FF', '#02023E')
    " Ruby
    call NERDTreeHighlightFile('rb', 'Red', 'none', 'red', '#02023E')

" }

" Change the colour scheme
colors darkblue

" Syntastic {
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    let g:syntastic_quiet_messages = { "type": "style" }
    let g:syntastic_php_checkers = ['php']
" }

" PIV {
    let g:DisableAutoPHPFolding = 1
" }
