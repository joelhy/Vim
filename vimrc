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

let mapleader = ","


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
    inoremap <leader>pd <ESC>:call PhpDocSingle()<CR>i
    nnoremap <leader>pd :call PhpDocSingle()<CR>
    vnoremap <leader>pd :call PhpDocRange()<CR>
endfunction
autocmd BufNewFile,BufRead *.php call PhpDocLoad()

set tabstop=4                   " how many columns a tab counts for
set shiftwidth=4                " how many columns an indent counts for
set expandtab                   " insert spaces when hitting Tab in insert mode
set number                      " show line number
set pastetoggle=<F2>            " pastetoggle (sane indentation on pastes)
set incsearch                   " find as you type search
set hlsearch                    " highlight search terms
set list                        " show invisible characters
set listchars=tab:▸\ ,trail:.,precedes:<,extends:>,eol:¬
"Invisible character colors 
highlight NonText ctermfg=darkgray
highlight SpecialKey ctermfg=darkgray

" o Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
" r Automatically insert the current comment leader after hitting <Enter> in Insert mode.
set formatoptions+=or

" C-style indent
set cindent

" Wrap lines
set wrap

" TagList options
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fild_Auto_Close = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Close_On_Select = 1
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let s:tlist_def_php_settings = 'php;c:class;f:function'

" NERDTree options
let NERDChristmasTree=1
let NERDTreeCaseSensitiveSort=1
let NERDTreeChDirMode=2
let NERDTreeBookmarksFile = "~/.vim_joelhy/NERDTreeBookmarks"
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
"map <Leader>n :NERDTree<CR>
map <Leader>n :NERDTreeToggle<CR>
"map <F10> :NERDTreeToggle<CR>

