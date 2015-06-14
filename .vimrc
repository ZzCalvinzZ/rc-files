filetype off

"show line numbers
set number

"turn on syntax highlighting
syntax on

"shows last command made
set showcmd

"turn off vi compatibility
set nocp

" Vundle stuff for plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/vundle')

"list of plugins to add
Plugin 'gmarik/Vundle.vim'
Plugin 'rking/ag.vim'
Plugin 'alvan/vim-closetag'
Plugin 'nixprime/cpsm'
Plugin 'godlygeek/csapprox'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'sjl/gundo.vim'
Plugin 'yegappan/mru'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
"Plugin 'powerline/powerline'
Plugin 'majutsushi/tagbar'
Plugin 'kchmck/vim-coffee-script'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'thinca/vim-guicolorscheme'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/html5.vim'
Plugin 'pfdevilliers/Pretty-Vim-Python'


call vundle#end()
filetype plugin indent on

"syntax highlighting
syntax on
let python_highlight_all = 1

"gives more space at the bottom so you don't have to hit enter to see stuff
set cmdheight=2

"stops the file from being closed when editing a new file 
"(hides it in a buffer)
set hidden

"maximize window when vim starts
set lines=999 columns=9999

"map leader set to Space key
let mapleader = " "

"map vimrc for quick access
map <Leader>v :e ~/.vimrc

"map plugin commands
map <Leader>2 :NERDTreeFind
map <Leader>3 :NERDTreeToggle
map <Leader>4 :TagbarToggle
map <Leader>a :MRU

"map tab manipulation commands
noremap <Leader>tc :tabc<cr>
noremap <Leader>te :tabe<cr>
noremap <Leader>to :tabo<cr>

"map window switching commands
noremap <Leader>k :wincmd k<cr>
noremap <Leader>j :wincmd j<cr>
noremap <Leader>h :wincmd h<cr>
noremap <Leader>l :wincmd l<cr>

"set omnicompolete to ctrl space
inoremap <C-Space> <C-x><C-o>

"what vim looks like
colorscheme monokain 
set guifont=Menlo\ Regular:h15

"incremental search(auto select first match when searching)
set incsearch

"this will ignore case unless explicitly searching with capitals
set ignorecase
set smartcase

"Shows menu items when tabbing for autocomplete
set wildmenu

"don't wrap text when it doesn't fit in the window
set nowrap

"4 space hard tabs with autoindenting
set tabstop=4
set smarttab
set shiftwidth=4
set noexpandtab
set autoindent

"highlight the line you are on
set cursorline

"persistent undo for when vim is closed
set undofile

"the amount of : commands saved and undo levels saved
set history=10000
set undolevels=10000

"number of lines shown above/below cursor
set scrolloff=5

"the last window will always have a status line
set laststatus=2

"keep the cursor on the same column when changing lines
set nostartofline

"NERDTree ignore files
let NERDTreeIgnore = ['\.pyc$']

set infercase
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d

" Enable omnicomplete for supported filetypes
autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=xmlcomplete#CompletePython

"change where vim stores backup and swap files
set backupdir=~/.vim/tmp,.
set dir=~/.vim/tmp//,.

"for gitgutter to free up leader + h
let g:gitgutter_map_keys = 0

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(pyc)$',
  \ 'link': '',
  \ }

"for airline to use powerline fonts
let g:airline_powerline_fonts = 1

"ctrlp replacement options
"let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
"
let g:airline_theme='dark'
