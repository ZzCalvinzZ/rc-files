"show line numbers
set number
"turn on syntax highlighting
syntax on

filetype off

" show tab markers
set list

"let unnamed register be clipboard
set clipboard=unnamed

"turn off vi compatibility
set nocp

call plug#begin('~/.vim/bundle')

"list of plugins to add
"Plug 'godlygeek/csapprox'
Plug 'junegunn/vim-plug'

"language syntax plugins
Plug 'pangloss/vim-javascript'
Plug 'neovimhaskell/haskell-vim'
Plug 'othree/html5.vim'
Plug 'tbastos/vim-lua'
Plug 'hdima/python-syntax'
Plug 'keith/tmux.vim'
Plug 'isRuslan/vim-es6'
Plug 'leafgarland/typescript-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'mitsuhiko/vim-jinja'
Plug 'mxw/vim-jsx'
"Plug 'posva/vim-vue'

let g:jsx_ext_required = 0

Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'ZzCalvinzZ/vim-sleuth'

"airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'

Plug 'ap/vim-css-color'
Plug 'michaeljsmith/vim-indent-object'
Plug 'godlygeek/tabular'
Plug 'Olical/vim-enmasse'
Plug 'maksimr/vim-jsbeautify'

Plug 'mustache/vim-mustache-handlebars'
Plug 'wellle/targets.vim'
Plug 'kshenoy/vim-signature'
Plug 'AndrewRadev/switch.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'joeytwiddle/sexy_scroller.vim'
Plug 'rking/ag.vim'
Plug 'mihaifm/bufstop'
Plug 'yegappan/mru'
Plug 'junegunn/vim-easy-align'
Plug 'luochen1990/rainbow'

"colors
Plug 'morhetz/gruvbox'

if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

	Plug 'zchee/deoplete-jedi'
	Plug 'davidhalter/jedi-vim'

	Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
	Plug 'ternjs/tern_for_vim', {'do': 'npm install'}

	Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/bundle/gocode/vim/symlink.sh' }
	Plug 'zchee/deoplete-go', { 'do': 'make'}
	Plug 'fatih/vim-go'

	"Plug 'neomake/neomake', { 'do':
								"\ 'npm install -g eslint@latest;
								"\ npm install -g babel-eslint@latest'
							"\}
	Plug 'w0rp/ale', { 'do':
						\ 'npm install -g eslint@latest;
						\ npm install -g eslint-plugin-babel@latest;
						\ npm install -g babel-eslint@latest'
					\}
endif

"Plug 'vim-scripts/AutoComplPop'

call plug#end()

" deoplete tab-complete
let g:deoplete#enable_at_startup = 1 
let g:jedi#completions_enabled = 0
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:deoplete#auto_complete_delay=150

"""""""""""""""""""""""""""""""""""""""
"jedi and tern stuff

function! SetupTern()
	map <buffer><leader>cg :TernDef
	map <buffer><leader>cd :TernDef
	map <buffer><leader>ck :TernDoc
	map <buffer><leader>cr :TernRename
	map <buffer><leader>cn :TernRefs
endfunction

function! SetupGo()
	map <buffer><leader>cd :GoDef
	map <buffer><leader>ck :GoDoc
	map <buffer><leader>cr :GoRename
	map <buffer><leader>cn :GoReferrers
endfunction

let g:jedi#goto_assignments_command = '<leader>cg'
let g:jedi#goto_definitions_command = '<leader>cd'
let g:jedi#documentation_command = '<leader>ck'
let g:jedi#rename_command = '<leader>cr'
let g:jedi#usages_command = '<leader>cn'

autocmd FileType javascript call SetupTern()
autocmd FileType go call SetupGo()

"""""""""""""""""""""""""""""""""""""""

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
map <Leader>u :UltiSnipsEdit

" automatically include certain sippets based on filetypes

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

filetype plugin indent on

"set this to the value of shiftwidth
let g:pyindent_open_paren=4

set norelativenumber

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
	map <Leader>z :e ~/.zshrc
endif

" rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\	'*': {},
\	'tex': {
\	    'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\	},
\	'lisp': {
\	    'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\	},
\	'vim': {
\	    'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\	},
\	'html': {
\	    'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\	},
\	'htmldjango': {
\	    'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\	},
\	'htmljinja': {
\	    'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\	},
\	'html.mustache': {
\	    'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\	},
\	'css': 0,
\   }
\}

function! Beautyness()
	if &filetype =~ 'javascript'
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

"map plugin commands
map <Leader>2 :NERDTreeFind
map <Leader>3 :NERDTreeToggle
map <Leader>5 :UndotreeToggle

"noremap <Leader>D :BufSurfBack
noremap <Leader>D :bp\|bd #

"map fugitive commands
noremap <Leader>ga :Git add .
noremap <Leader>gs :Gstatus
noremap <Leader>gp :Gpush
noremap <Leader>gd :Gdiff
noremap <Leader>gb :Gblame wM
noremap <Leader>gr :Gread

noremap <Leader>gdt :windo diffthis
noremap <Leader>gds :windo diffoff

"vimdiff mappings
noremap <Leader>dp :diffput 4

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

map <leader>Q :q!<cr>
map <leader>q :q<cr>
map <leader>w :w<cr>

"bufstop mappings
map <leader>< :BufstopBack<CR>
map <leader>> :BufstopForward<CR>

"for fzf Ag
autocmd VimEnter * command! -nargs=* -bang Agf call fzf#vim#ag(<q-args>, <bang>0)

"fzf mappings
map <C-p> :Files
map <leader>fa :Agf
map <leader>fg :GFiles
map <leader>fb :Buffers
map <leader>fl :Lines
map <leader>fs :Snippets
map <leader>fc :Commits
map <leader>ff :BCommits
map <leader>fm :MRUFilesCWD

"easier formatting
map <leader>= :set noexpandtab<bar>normal ggVG=
map <leader>+ :set expandtab<bar>normal ggVG=

""""""""""" MRU - FZF integration """"""""""
command! MRUFilesCWD call fzf#run({
\  'source':  s:mru_files_for_cwd(),
\  'sink':    'edit',
\  'options': '-m -x +s --prompt=MRU:'.shellescape(pathshorten(getcwd())).'/',
\  'down':    '40%' })

function! s:mru_files_for_cwd()
  return map(filter(
  \  systemlist("sed -n '2,$p' ~/.vim_mru_files"),
  \  "v:val =~ '^" . getcwd() . "' && v:val !~ '__Tagbar__\\|\\[YankRing]\\|fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"
  \ ), 'fnamemodify(v:val, ":p:.")')
endfunction
"""""""""""""""""""""""""""""""""""""""""""

"mru mapping
map <Leader>m :MRU

function! Retab()
	set noexpandtab
	:%retab!<cr>
endfunction

"map retab
noremap <Leader>t :call Retab()<cr>

"map space f to copy current file to clipboard
nmap <Leader>f :let @* = expand("%")<cr>

"toggle background easily
map <Leader>B :let &background = ( &background == "dark"? "light" : "dark" )<CR>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"what vim looks like
set background=dark
colorscheme gruvbox
"set termguicolors

set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h13

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

function! SetupEnvironment()
	set tabstop=4
endfunction

autocmd BufNewFile,FileType * call SetupEnvironment()

"highlight the line you are on
set cursorline cursorcolumn

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

"when doing zl or zh do it 30 spaces instead (horizontal scroll)
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

"airline stuff
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_extensions = []

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

"shows last command made
set showcmd

set backspace=2
set backspace=indent,eol,start

"windows stuff
if has("win32")
	set directory=.,$TEMP
	set backupdir=.,$TEMP
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
endif

"for gitgutter
nmap <Leader>ggs <Plug>GitGutterStageHunk
nmap <Leader>ggr <Plug>GitGutterRevertHunk
nmap <Leader>ggp <Plug>GitGutterPreviewHunk
nmap <Leader>ggu <Plug>GitGutterUndoHunk

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

"use enter and shift enter to add blank lines without ending up in insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"use ctrl-a and ctrl-e as home and end
:inoremap <C-E> <End>
:inoremap <C-A> <Home>

set sidescroll=1

"vim switch stuff for switching boolean values
let g:switch_mapping = "-"

"sexy scroller options
let g:SexyScroller_ScrollTime = 15
let g:SexyScroller_CursorTime = 5
let g:SexyScroller_MaxTime = 100


let g:python_host_prog = '/usr/local/Cellar/python/2.7.12_2/bin/python'
let g:python3_host_prog = '/usr/local/Cellar/python3/3.6.1/bin/python3'

" ALE stuff for linting

let g:ale_python_pylint_use_global = 1
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '?'

"ALL NEOMAKE THINGS

"let g:neomake_python_flake8_maker = {
   "\ 'args': ['--ignore=E501,E265,E402,E116,W191,E731,E261,E262,E266,E302,E128,E124'],
"\ }

"let g:neomake_javascript_enabled_makers = ['eslint']

"let g:neomake_python_enabled_makers = ['flake8', 'python']
"let g:neomake_open_list=2
"let g:neomake_list_height=5
"autocmd! BufWritePost * Neomake

" add template paths for gf completing
set path+=~/dev/fluidreview/apps/chide/products/smapply/templates/
set path+=~/dev/fluidreview/apps/chide/products/smapply/mail/templates/
set path+=~/dev/fluidreview/apps/chide/products/reviewroom/templates/
set path+=~/dev/fluidreview/reviewroom/templates/
set path+=~/dev/fluidreview/apps
set path+=~/dev/fluidreview/apps/chide/products/smapply/static/

set path+=~/dev/leagion/assets/js/

"live substitution
if has('nvim')
	set inccommand=nosplit
endif

if &diff
	hi DiffText   cterm=none ctermfg=Black ctermbg=Red gui=none guifg=Black guibg=Red
	hi DiffChange cterm=none ctermfg=Black ctermbg=LightMagenta gui=none guifg=Black guibg=LightMagenta
endif

"emmet
let g:user_emmet_leader_key = '<C-q>'
