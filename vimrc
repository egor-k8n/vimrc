call pathogen#infect()
call pathogen#helptags()

""" Disable vi compatibility
"""
set nocompatible

""" Enable filetype plugins
"""
filetype plugin indent on

""" Do not expand tabs in makefiles
"""
au Filetype Makefile set noexpandtab

""" Use python3 omni-completion for python files
"""
au FileType python set omnifunc=python3complete#Complete

""" Enable vala syntax highlighting
"""
au BufEnter,BufNew *.vala set ft=vala

""" Use 2 spaces for scala indent
"""
au FileType scala set sw=2 ts=2 sts=2

""" Close vim if only nerdtree buffer is left
"""
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

""" Close nerdtree after opening a file
"""
let g:NERDTreeQuitOnOpen=1

""" Disable all haskell conceals
"""
let g:haskell_conceal = 0

""" Reload .vimrc automatically
"""
au! bufwritepost .vimrc source %

""" Enter paste mode on F2
"""
set pastetoggle=<F2>

""" UI
"""
set t_Co=256                       " set 256 colors mode
colorscheme zazen                  " use zazen color scheme
if has('gui_running')
  if has('unix')
    " use liberation font
    set guifont=Liberation\ Mono\ 10
  else
    " use consolas font
    set guifont=Consolas
    " backspace through everything
    set backspace=indent,eol,start
    " set default encoding
    if &termencoding == ""
      let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
  endif
  set guioptions=                  " remove menu bar, scrollbars, etc.
  set lines=39                     " set default window height to 39
  set columns=110                  " set default window width to 110
endif
set hidden                         " allow unloading the buffer with unsaved changes
set noerrorbells                   " disable beeping on error
set novisualbell                   " disable visual bell
set relativenumber                 " show relative line numbers
set foldcolumn=1                   " show fold column
set foldmethod=syntax              " fold using syntax rules
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='bubblegum'

""" Syntax related options
"""
syntax on       " enable syntax highlighting
set showmatch   " show matching braces
set autoindent  " copy indent from current line when starting a new line
set smartindent " do smart autoindenting when starting a new line

""" Backup & swap
"""
set nobackup   " do not make a backup before overwriting a file
set noswapfile " do not create a swap file

""" Ignore following patterns while expanding wildcards
"""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

""" Always show status line
"""
set laststatus=2

""" Tabulation related options
"""
set expandtab     " use spaces instead of tabs
set shiftwidth=4  " use 4 spaces for each step of indent
set tabstop=4     " count <Tab> as 4 spaces
set softtabstop=4 " count <Tab> as 4 spaces while editing
set smarttab      " <Tab> in front of a line inserts 4 spaces

""" Menu related options
"""
set wildmenu        " enable wild menu
set wildchar=<TAB>  " scroll through wild menu on tab

""" Search related options
"""
set ignorecase      " case-insensetive search
set smartcase       " override the ignorecase if the search patter contains upper case characters
set hlsearch        " highlight matched results
set incsearch       " search while typing

""" Misc options
"""
" autoreload file, when it is modified from outside
set autoread
" do not change directory on file editing
set noautochdir
" Autoremove trailing spaces
autocmd BufWritePre * if (&filetype != 'diff') | :%s/\s\+$//e | endif
" Autogenerate ctags
au BufWritePost !ctags -R &
" Delimit comments with spaces when using NERDCommenter
let NERDSpaceDelims=1

""" Key mapings
"""
let maplocalleader="-"
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <silent> <leader>u :GundoToggle<CR>
nnoremap <silent> <leader>p :CtrlPMixed<CR>
nnoremap <silent> <leader>[ :CtrlPBufTag<CR>
nnoremap <silent> <leader>] :CtrlPBuffer<CR>
nnoremap <silent> <leader>r :CtrlPRegister<CR>
nnoremap <silent> <leader>m :CtrlPMark<CR>
nnoremap <silent> <leader>h :CtrlPHg<CR>
nnoremap <silent> <leader>t :TagbarToggle<CR>
nnoremap <silent> <leader>o :NERDTreeToggle<CR>
nnoremap <silent> <leader>l :ls<CR>
nnoremap <silent> <leader>c :set colorcolumn=80<CR>
nnoremap <silent> <leader>x :set colorcolumn=999<CR>
nnoremap <silent> ,/ :nohlsearch<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

""" Use Q for formatting the current paragraph (or selection)
"""
vmap Q gq
nmap Q gqap

""" Russian keymap
"""
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >

""" Stop using arrow keys! STOP! Just stop, okay?
"""
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
