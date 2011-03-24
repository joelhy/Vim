set nocompatible

" let $VIMRUNTIME="~/.vim_joelhy/"
set runtimepath=~/.vim_joelhy,$VIMRUNTIME

set background=dark
set fileencodings=utf-8,gbk,ucs-bom,cp936
set incsearch  " Incremental search

set tabstop=4  " 制表符的宽度
set shiftwidth=4  "缩进的空格数
set expandtab  " 在缩进和遇到Tab键时使用空格替代


" PHP 代码完成
filetype plugin on
au FileType php set omnifunc=phpcomplete#CompletePHP

"""""""""""""""""""""""""""""""""
" PHP syntax settings
"""""""""""""""""""""""""""""""""
let php_sql_query=1             " Enable SQL syntax highlighting inside Strings 
let php_htmlInStrings=1         " Enable HTML syntax highlighting inside strings
let php_folding=1               " Enable folding for classes and functions
let php_parent_error_close=1    " Highlighting parent error ] or )
let php_parent_error_open=1     " Highlighting if there exists an open ( or [ without a closing one

" PHP parser check (CTRL-L)
autocmd FileType php noremap <C-L> :!/usr/bin/php -l %<CR>

" run file with PHP CLI (CTRL-M)
autocmd FileType php noremap <C-M> :w!<CR>:!/usr/bin/php %<CR>

" PHPDOC support
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR>

" C-style indent
set cindent

" Wrap lines
set wrap

" o Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
" r Automatically insert the current comment leader after hitting <Enter> in Insert mode.
set formatoptions+=or


