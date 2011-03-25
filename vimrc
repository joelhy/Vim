set nocompatible

" let $VIMRUNTIME="~/.vim_joelhy/"
set runtimepath=~/.vim_joelhy,~/.vim_joelhy/doc/php-manual,$VIMRUNTIME

set background=dark
set fileencodings=utf-8,gbk,ucs-bom,cp936
set incsearch  " Incremental search

set tabstop=4  " How many columns a tab counts for
set shiftwidth=4  " How many columns an indent counts for
set expandtab  " Insert spaces when hitting Tab in insert mode
set number  " show line number


" PHP code autocomplete
filetype plugin on
au FileType php set omnifunc=phpcomplete#CompletePHP

"""""""""""""""""""""""""""""""""
" PHP syntax settings
"""""""""""""""""""""""""""""""""
let php_sql_query=1             " Enable SQL syntax highlighting inside Strings 
let php_htmlInStrings=1         " Enable HTML syntax highlighting inside strings
let php_folding=0               " Enable folding for classes and functions
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

" PHP manual support
autocmd BufNewFile,Bufread *.inc,*.tpl,*.php set keywordprg="help"

" C-style indent
set cindent

" Wrap lines
set wrap

" o Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
" r Automatically insert the current comment leader after hitting <Enter> in Insert mode.
set formatoptions+=or


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taglist
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 1
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_File_Fold_Auto_Close = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 0
let Tlist_Show_Menu = 0
let Tlist_Show_One_File = 0
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 40
let tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function'

