set nocompatible
filetype off

set fileencodings=ucs-bom,utf-8,gbk
set background=dark             " Assume a dark background
syntax on
colorscheme evening

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/syntastic'
Plugin 'plasticboy/vim-markdown'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'taglist.vim'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put non-Plugin stuff after this line

" set file types
au BufNewFile,BufRead *.lbi set filetype=php
au BufNewFile,BufRead *.dwt set filetype=php

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

" do syntax checks when buffers are first loaded as
" well as on saving 
let g:syntastic_check_on_open=1
" automatically open or close error window
let g:syntastic_auto_loc_list=1
let g:syntastic_phpcs_disable=1
"set tab width to 4, coding standard to CodeIgniter
"let g:syntastic_phpcs_conf = "--tab-width=4 --standard=CodeIgniter"

" PHPDOC support
function! PhpDocLoad()
    so ~/.vim/doc/php-doc.vim
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
let tlist_php_settings = 'php;c:class;f:function'

" NERDTree options
let NERDChristmasTree=1
let NERDTreeCaseSensitiveSort=1
let NERDTreeChDirMode=2
let NERDTreeBookmarksFile = "~/.vim/NERDTreeBookmarks"
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
"map <Leader>n :NERDTree<CR>
map <Leader>n :NERDTreeToggle<CR>
"map <F10> :NERDTreeToggle<CR>



" fold codes
set foldmethod=syntax
set foldlevel=100


:nnoremap <F5> "=strftime("@since %Y-%m-%d %H:%M:%S")<CR>P
:inoremap <F5> <C-R>=strftime("@since %Y-%m-%d %H:%M:%S")<CR>

" code fold settings
set foldmethod=indent
set foldignore=


" search settings
set incsearch
set ignorecase
set smartcase


