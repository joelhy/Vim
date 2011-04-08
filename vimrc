set nocompatible
set runtimepath=~/.vim_joelhy,$VIMRUNTIME
set background=dark             " Assume a dark background
set fileencodings=ucs-bom,utf-8,gbk

" Enable pathogen bundles
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Turn on filetype plugins
filetype plugin on
filetype plugin indent on

set tabstop=4                   " how many columns a tab counts for
set shiftwidth=4                " how many columns an indent counts for
set expandtab                   " insert spaces when hitting Tab in insert mode
set number                      " show line number
set pastetoggle=<F2>            " pastetoggle (sane indentation on pastes)
set incsearch                   " find as you type search
set hlsearch                    " highlight search terms


" NERDTree
map <F10> :NERDTreeToggle<CR>

" PHP code autocomplete
au FileType php set omnifunc=phpcomplete#CompletePHP

"""""""""""""""""""""""""""""""""
" PHP syntax settings
"""""""""""""""""""""""""""""""""
let php_sql_query=1             " enable SQL syntax highlighting inside Strings 
let php_htmlInStrings=1         " enable HTML syntax highlighting inside strings
let php_folding=0               " enable folding for classes and functions
let php_parent_error_close=1    " highlighting parent error ] or )
let php_parent_error_open=1     " highlighting if there exists an open ( or [ without a closing one

" PHP parser check (CTRL-L)
autocmd FileType php noremap <C-L> :!/usr/bin/php -l %<CR>

" PHP manual support
"autocmd BufNewFile,Bufread *.inc,*.tpl,*.php set keywordprg="help"
" Make sure help set properly for PHP files
"autocmd FileType php set kp=:help
autocmd FileType php set keywordprg=~/.vim_joelhy/doc/php_man

" PHPDOC support
function! PhpDocLoad()
    so ~/.vim_joelhy/doc/php-doc.vim
    inoremap ,pd <ESC>:call PhpDocSingle()<CR>i
    nnoremap ,pd :call PhpDocSingle()<CR>
    vnoremap ,pd :call PhpDocRange()<CR>
endfunction
autocmd BufNewFile,BufRead *.php call PhpDocLoad()

" o Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
" r Automatically insert the current comment leader after hitting <Enter> in Insert mode.
set formatoptions+=or

" C-style indent
set cindent

" Wrap lines
set wrap

