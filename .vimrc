"show line numbers
set number
"turn on syntax highlighting
syntax on

filetype off

"turn off vi compatibility
set nocp

" Vundle stuff for plugins
if has("win32")
	set rtp+=\Users\Calvin\vimfiles\bundle\Vundle.vim
else
	set rtp+=~/.vim/bundle/Vundle.vim
endif

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
Plugin 'majutsushi/tagbar'
Plugin 'kchmck/vim-coffee-script'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'thinca/vim-guicolorscheme'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
"Plugin 'pfdevilliers/Pretty-Vim-Python'
"Plugin 'zzcalvinzz/neovim-gitgutter'
Plugin 'marijnh/tern_for_vim'
Plugin 'unblevable/quick-scope'
Plugin 'leafgarland/typescript-vim.git'
Plugin 'mbbill/undotree.git'
Plugin 'ap/vim-css-color'
Plugin 'takac/vim-hardtime'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'tmhedberg/SimpylFold'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

call vundle#end()
filetype plugin indent on

let python_highlight_all = 1

let b:did_indent = 1

set relativenumber

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
if has("win32")
	map <Leader>v :e \Users\Calvin\_vimrc
else
	map <Leader>v :e ~/.vimrc
endif

"hard mode commands
nnoremap <leader>u <Esc>:call HardTimeToggle()<CR>
let g:hardtime_default_on = 1

"map plugin commands
map <Leader>2 :NERDTreeFind
map <Leader>3 :NERDTreeToggle
map <Leader>4 :TagbarToggle
map <Leader>m :MRU
map <Leader>5 :UndotreeToggle

"map fugitive commands
noremap <Leader>a :Git add .
noremap <Leader>s :Gstatus
noremap <Leader>p :Gpush
noremap <Leader>d :Gdiff
noremap <Leader>b :Gblame
noremap <Leader>r :Gread

"map tab manipulation commands
noremap <Leader>tc :tabc<cr>
noremap <Leader>te :tabe<cr>
noremap <Leader>to :tabo<cr>

"map window switching commands
noremap <Leader>k :wincmd k<cr>
noremap <Leader>j :wincmd j<cr>
noremap <Leader>h :wincmd h<cr>
noremap <Leader>l :wincmd l<cr>

"map retab
noremap <Leader>t :%retab!<cr>

"map space f to copy current file to clipboard
nmap <Leader>f :let @* = expand("%")<cr>

"map f12 to generate ctags
noremap <Leader>C :! ctags<cr>

"set omnicompolete to ctrl space
inoremap <C-Space> <C-x><C-o>

"stop using esc to escape from insert mode
inoremap <esc> <nop>
inoremap <C-c> <esc>

"what vim looks like
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
set guifont=Menlo\ for\ Powerline:h14

"don't use menu popup when it detects new changes in gui
set guioptions+=c

set foldmethod=syntax
set foldlevelstart=1

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

"for vim-javascript to show html and css highlighting
let javascript_enable_domhtmlcss=1

"for coffeescript folding
autocmd BufNewFile,BufReadPost *.coffee call SetCoffeeFolding()

function! SetCoffeeFolding()
	"execute ":setl fdm=expr fde=getline(v:lnum)=~'class'?'>1':getline(v:lnum)=~'^\\s*$'?0:'='"
	execute ":setl fdm=expr fde=getline(v:lnum)=~'->$'?'>1':getline(v:lnum)=~'^\\s*$'?0:'='"
	execute ":normal zM"
endfunction

"incremental search(auto select first match when searching)
set incsearch
set hlsearch

"this will ignore case unless explicitly searching with capitals
set ignorecase
set smartcase

"Shows menu items when tabbing for autocomplete
set wildmode=longest,list,full
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

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

"when doing zl or zh do it 30 spaces instead
nnoremap zl 30zl
nnoremap zh 30zh

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

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(pyc)$',
  \ 'link': '',
  \ }

"for airline to use powerline fonts
let g:airline_powerline_fonts = 1

"airline font stuff
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:ctrlp_cmd = 'CtrlPMixed'
"ctrlp replacement options
"let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
"ctrlp stuff to show all files
"
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

"make diffs appear side by side
set diffopt=vertical

"airline theme
let g:airline_theme='powerlineish'

"make gitgutter faster
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

"change where vim stores backup and swap files
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

"for quick-scope in find mode
let g:qs_enable = 0
let g:qs_enable_char_list = [ 'f', 'F', 't', 'T' ]

"this function allows you to visually select lines to perform macro
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
	echo "@".getcmdline()
	execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw
        let needs_disabling = 1
    endif
    let letter = nr2char(getchar())
    if needs_disabling
        QuickScopeToggle
    endif
    return a:movement . letter
endfunction

for i in g:qs_enable_char_list
	execute 'noremap <expr> <silent>' . i . " Quick_scope_selective('". i . "')"
endfor

"shows last command made
set showcmd

if has("win32")
	set directory=.,$TEMP
	set backupdir=.,$TEMP
	set backspace=2
	set backspace=indent,eol,start
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
endif

"for gitgutter
nmap <Leader>gs <Plug>GitGutterStageHunk
nmap <Leader>gr <Plug>GitGutterRevertHunk
nmap <Leader>gp <Plug>GitGutterPreviewHunk
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
set updatetime=250

"determine whether to indent tabs or spaces based on buffer
function TabsOrSpaces()
    " Determines whether to use spaces or tabs on the current buffer.
    if getfsize(bufname("%")) > 256000
        " File is very large, just use the default.
        return
    endif

    let numTabs=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^\\t"'))
    let numSpaces=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^ "'))

    if numTabs < numSpaces
        setlocal expandtab
    endif
endfunction

" Call the function after opening a buffer
autocmd BufReadPost * call TabsOrSpaces()

"call silver searcher for word under cursor
:nnoremap <Leader>A :Ag -Q '<cword>' -G "py\|js\|html" <CR>
