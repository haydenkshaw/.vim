"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => First bits
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" On Windows, use '.vim' instead of 'vimfiles'.
" This makes synchronization across (heterogeneous) systems easier.
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" Use Pathogen to load Vim plug-ins
runtime plugins/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect('plugins/{}')
execute pathogen#helptags()

" Turn backup and swap off
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Aesthetics
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guioptions-=m  " Removes menu bar
set guioptions-=T  " Removes toolbar
set guioptions-=r  " Removes right-hand scroll bar
set guioptions-=L  " Removes left-hand scroll bar

" Make backspace work on Windows 
" http://stackoverflow.com/questions/5419848/backspace-doesnt-work-in-gvim-7-2-64-bit-for-windows
set backspace=2
set backspace=indent,eol,start

" Tabstops of 4, and prefer spaces to tabs. Text width 80 and wrapping
" My dark default background and syntax highlighting.
set nocompatible
set encoding=utf-8
set expandtab
set textwidth=80
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
set background=dark
syntax on
set tags=$HOME/.vim/doc/tags
set ttyfast
set showcmd
set showmode
set wildmenu
set wildmode=list:longest
set undofile
set splitbelow
set splitright

if has('macunix')
    set guifont=Source\ Code\ Pro:h11
endif
if has('win32') || has('win64')
    set guifont=Source_Code_Pro:h11:cANSI
endif

" Added based on http://www.perlmonks.org/index.pl?node_id=441738
set smarttab
set shiftround
set autoindent
set smartindent

" Highlight Searches
set hlsearch

" 2-space tab-width for HTML, CSS, JS and Ruby
autocmd FileType html set shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css set shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType js set shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType jsx set shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType ruby set shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType haml set shiftwidth=2 tabstop=2 softtabstop=2

" Change the colour scheme
colors darkblue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

if has("gui_running")
    " Ctrl-X cuts in normal and insert mode
    noremap <C-X> "+x
    inoremap <C-X> <Esc>"+x

    " Ctrl-C copies in normal mode and insert mode
    noremap <C-C> "+y
    inoremap <C-C> <Esc>"+y

    " Ctrl-V pastes in normal mode  and insert mode
    noremap <C-V> "+gP   
    inoremap <C-V> <Esc>"+gP

    " Ctrl-S saves document in normal, visual and insert mode
    noremap  <C-S> :w<CR>
    vnoremap <C-S> :w<CR>
    inoremap <C-S> <Esc>:w<CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree {
    let NERDTreeIgnore=[ '\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$', '\.DS_Store$' ]
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    
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

" syntastic {
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Miscellaneous
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto reload vimrc on save for all buffers
" http://stackoverflow.com/questions/4158277/automatically-reload-vimrc-edited-in-a-vim-session-in-an-already-opened-gvim-in
function! UpdateVimRC()
    for server in split(serverlist())
        call remote_send(server, '<Esc>:source $HOME/.vimrc<CR>')
    endfor
endfunction
augroup myvimrchooks
au!
    autocmd bufwritepost .vimrc call UpdateVimRC()
augroup END
