"show line numbers
set number
"turn on syntax highlighting
syntax on

filetype off

"turn off vi compatibility
set nocp

call plug#begin('~/.vim/bundle')

"list of plugins to add
Plug 'rking/ag.vim'
"Plug 'godlygeek/csapprox'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'yegappan/mru'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'kchmck/vim-coffee-script'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'thinca/vim-guicolorscheme'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'ap/vim-css-color'
Plug 'michaeljsmith/vim-indent-object'
Plug 'godlygeek/tabular'
Plug 'nixprime/cpsm' , { 'do': './install.sh' }
Plug 'Olical/vim-enmasse'
Plug 'terryma/vim-multiple-cursors'

if has("gui_running")
	Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
endif

Plug 'ervandew/supertab'
Plug 'mustache/vim-mustache-handlebars'
Plug 'isRuslan/vim-es6'
Plug 'junegunn/vim-plug'
Plug 'maksimr/vim-jsbeautify'
Plug 'wellle/targets.vim'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-scriptease'
Plug 'vim-scripts/repmo.vim'
Plug 'AndrewRadev/switch.vim'

"Plug 'vim-scripts/AutoComplPop'

call plug#end()

let g:ycm_dont_warn_on_startup = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ycm_filetype_blacklist = {
	\'fugitiveblame' : 1,
\}

let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'

let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'

" automatically include certain sippets based on filetypes
autocmd FileType html set ft=htmldjango.html

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

filetype plugin indent on

"fixes macvim python defaults

let python_highlight_all = 1
let b:did_indent = 1

"set this to the value of shiftwidth
let g:pyindent_open_paren=4

set relativenumber

"gives more space at the bottom so you don't have to hit enter to see stuff
set cmdheight=2

"stops the file from being closed when editing a new file 
"(hides it in a buffer)
set hidden

" allows incsearch highlighting for range commands
cnoremap $t <CR>:t''<CR>
cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>``

"maximize window when vim starts
"set lines=999 columns=9999

"map leader set to Space key
let mapleader = " "

"map vimrc for quick access
if has("win32")
	map <Leader>v :e \Users\Calvin\_vimrc
else
	map <Leader>v :e ~/.vimrc
	map <Leader>V :e ~/.bash_profile
endif

"rainbow parentheses
let g:rainbow_active = 1

"map plugin commands
map <Leader><Leader>2 :NERDTreeFind
map <Leader><Leader>3 :NERDTreeToggle
map <Leader><Leader>4 :TagbarToggle
map <Leader><Leader>5 :UndotreeToggle

noremap <Leader>D :bp\|bd #
map <Leader>m :MRU

"map fugitive commands
noremap <Leader>a :Git add .
noremap <Leader>s :Gstatus
noremap <Leader>p :Gpush
noremap <Leader>dg :Gdiff
noremap <Leader>B :Gblame
noremap <Leader>r :Gread

noremap <Leader>dt :windo diffthis
noremap <Leader>ds :windo diffoff

"map tab manipulation commands
noremap <Leader>tc :tabc<cr>
noremap <Leader>te :tabe<cr>
noremap <Leader>to :tabo<cr>

"map window switching commands
noremap <Leader>k :wincmd k<cr>
noremap <Leader>j :wincmd j<cr>
noremap <Leader>h :wincmd h<cr>
noremap <Leader>l :wincmd l<cr>
noremap <Leader><s-k> :split<cr>
noremap <Leader><s-j> :split<cr>
noremap <Leader><s-h> :vsplit<cr>
noremap <Leader><s-l> :vsplit<cr>

"CtrlP
nnoremap <C-\> :CtrlPBuffer<CR>

function! Retab()
	set noexpandtab
	:%retab!<cr>
endfunction

"map retab
noremap <Leader>t :call Retab()<cr>

"map space f to copy current file to clipboard
nmap <Leader>f :let @* = expand("%")<cr>

"map f12 to generate ctags
noremap <Leader>C :! ctags<cr>

"set omnicompolete to ctrl space
inoremap <C-Space> <C-x><C-o>

"stop using esc to escape from insert mode
inoremap <C-c> <esc>

"toggle background easily
map <Leader><Leader>b :let &background = ( &background == "dark"? "light" : "dark" )<CR>

"what vim looks like
set background=dark
colorscheme gruvbox
set guifont=Menlo\ for\ Powerline:h14

"don't use menu popup when it detects new changes in gui
set guioptions+=c

set foldlevelstart=99

setlocal foldmethod=indent

"for vim-javascript to show html and css highlighting
let javascript_enable_domhtmlcss=1

"incremental search(auto select first match when searching)
set incsearch
"set hlsearch

"this will ignore case unless explicitly searching with capitals
set ignorecase
set smartcase

"Shows menu items when tabbing for autocomplete
set wildmode=longest,list,full
set wildmenu

"don't wrap text when it doesn't fit in the window
set nowrap

"wrap this in a function so that it overrides macvim settings
function! OverrideIndentation()
	"4 space hard tabs with autoindenting
	set tabstop=4
	set smarttab
	set shiftwidth=4
	set noexpandtab
	set autoindent
endfunction

autocmd BufReadPost * call OverrideIndentation()

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

"NERDTree stuff
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
let g:NERDTreeMapHelp = '<F1>'

"when doing zl or zh do it 30 spaces instead
nnoremap zl 30zl
nnoremap zh 30zh

set infercase
"Set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d

" Enable omnicomplete for supported filetypes
autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType python set omnifunc=pythoncomplete#Complete

"detect .md as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"use gitignore for ctrlp ignore

function! CtrlPIgnoreToggle()
	if g:custom_ctrlp_on==0
		let g:custom_ctrlp_on=1
		let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
		:echo 'now using gitignore'
	else
		let g:custom_ctrlp_on=0
		let g:ctrlp_user_command = ''
		:echo 'not using gitignore anymore'
	endif
endfunction

let g:custom_ctrlp_on=1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
noremap <Leader><Leader>p :call CtrlPIgnoreToggle() <CR>

"use cpsm as matcher for ctrlp
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
"let g:cpsm_match_empty_query = 0

"always use ctrlp from the directory it started out in
let g:ctrlp_working_path_mode = 0

"airline stuff
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1

let g:airline#extensions#tabline#buffer_idx_mode = 1

" Just filename in the tabline
let g:airline#extensions#tabline#fnamemod = ':t'

" Easier tab/buffer switching
nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4
nmap <Leader>5 <Plug>AirlineSelectTab5
nmap <Leader>6 <Plug>AirlineSelectTab6
nmap <Leader>7 <Plug>AirlineSelectTab7
nmap <Leader>8 <Plug>AirlineSelectTab8
nmap <Leader>9 <Plug>AirlineSelectTab9

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

"ctrlp stuff
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

"make diffs appear side by side
set diffopt=vertical

"make gitgutter faster
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

"change where vim stores backup and swap files
"set backupdir=~/.vim/backup//
set nobackup
set noswapfile
set undodir=~/.vim/undo//

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

"shows last command made
set showcmd

set backspace=2
set backspace=indent,eol,start

if has("win32")
	set directory=.,$TEMP
	set backupdir=.,$TEMP
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
endif

"for gitgutter
nmap <Leader>gs <Plug>GitGutterStageHunk
nmap <Leader>gr <Plug>GitGutterRevertHunk
nmap <Leader>gp <Plug>GitGutterPreviewHunk
nmap <Nop> <Plug>GitGutterUndoHunk

let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
set updatetime=250

"determine whether to indent tabs or spaces based on buffer
function! TabsOrSpaces()
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

"use enter and shift enter to add blank lines without ending up in insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

map <Leader><BS> :!rm -r ~/.vim/swap/* <CR>

"use ctrl-a and ctrl-e as home and end
:inoremap <C-E> <End>
:inoremap <C-A> <Home>

"interesting words stuff
nnoremap <silent> <Leader>i :call InterestingWords('n')<cr>
nnoremap <silent> <Leader>I :call UncolorAllWords()<cr>
nnoremap <Insert> <Plug>InterestingWords

set sidescroll=1

if has("gui_running")
	set transparency=10
endif

function! Beautyness()
	if &filetype == 'javascript'
		call RangeJsBeautify()
	elseif &filetype == 'html'
		call RangeHtmlBeautify()
	elseif &filetype == 'html.mustache'
		call RangeHtmlBeautify()
	elseif &filetype == 'css'
		call RangeCSSBeautify()
	elseif &filetype == 'json' || &filetype == 'python'
		call RangeJsonBeautify()
	endif
endfunction

vmap <c-b> :call Beautyness()<cr>

"vim switch stuff for switching boolean values
let g:switch_mapping = "-"

"let g:switch_custom_definitions =
    "\ [
    "\   ['foo', 'bar', 'baz']
    "\ ]
