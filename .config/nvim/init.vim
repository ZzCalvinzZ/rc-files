set nocompatible "make sure it's in vim mode
set number "show line numbers
set list " show tab markers
set clipboard=unnamed "let unnamed register be clipboard
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h13
set guioptions+=c "don't use menu popup when it detects new changes in gui
set foldlevelstart=99
set incsearch "incremental search(auto select first match when searching)
set ignorecase "this will ignore case unless explicitly searching with capitals
set smartcase
set wildmode=longest,list,full "Shows menu items when tabbing for autocomplete
set wildmenu
set nowrap "don't wrap text when it doesn't fit in the window
set undofile "persistent undo for when vim is closed
set history=10000 "the amount of : commands saved
set undolevels=10000 "the amount undo levels saved
set scrolloff=5 "number of lines shown above/below cursor
set sidescroll=1
set laststatus=2 "the last window will always have a status line
set nostartofline "keep the cursor on the same column when changing lines
set inccommand=nosplit "live substitution
set showcmd "shows last command made
set backspace=indent,eol,start
set nobackup
set noswapfile
set undodir=~/.config/.nvim/undo//
set diffopt=vertical "make diffs appear side by side
set hidden "don't close file (hide it in a buffer)
set relativenumber
set mouse=a
setlocal foldmethod=indent
set cursorcolumn
set cursorline


syntax on "turn on syntax highlighting
filetype off
filetype plugin indent on
hi Normal ctermbg=NONE 

"when opening new file, do this stuff
function! SetupEnvironment()
	set tabstop=4
endfunction
autocmd BufNewFile,FileType * call SetupEnvironment()

"better colors when using as diff
if &diff
	hi DiffText   cterm=none ctermfg=Black ctermbg=Red gui=none guifg=Black guibg=Red
	hi DiffChange cterm=none ctermfg=Black ctermbg=LightMagenta gui=none guifg=Black guibg=LightMagenta
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/bundle')

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
Plug 'mustache/vim-mustache-handlebars'
Plug 'mitsuhiko/vim-jinja'
Plug 'mxw/vim-jsx'
Plug 'joeytwiddle/sexy_scroller.vim'

let g:jsx_ext_required = 0

Plug 'scrooloose/nerdcommenter'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
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

Plug 'ap/vim-css-color'
Plug 'michaeljsmith/vim-indent-object'
Plug 'godlygeek/tabular'
Plug 'Olical/vim-enmasse'
Plug 'maksimr/vim-jsbeautify'

Plug 'wellle/targets.vim'
Plug 'kshenoy/vim-signature'
Plug 'AndrewRadev/switch.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'mihaifm/bufstop'
Plug 'yegappan/mru'
Plug 'junegunn/vim-easy-align'

"colors
Plug 'morhetz/gruvbox'

"Autocomplete and related
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.config/nvim/bundle/gocode/vim/symlink.sh' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go'

"linting
Plug 'w0rp/ale', { 'do':
					\ 'npm install -g eslint@latest;
					\ npm install -g eslint-plugin-babel@latest;
					\ npm install -g babel-eslint@latest'
				\}

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"what vim looks like
set background=dark
colorscheme gruvbox

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" deoplete tab-complete
let g:deoplete#enable_at_startup = 1 
let g:jedi#completions_enabled = 0
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:deoplete#auto_complete_delay=150

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"for vim-javascript to show html and css highlighting
let javascript_enable_domhtmlcss=1

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
map <Leader>u :UltiSnipsEdit
let g:UltiSnipsEditSplit="vertical" "If you want :UltiSnipsEdit to split your window.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set this to the value of shiftwidth
let g:pyindent_open_paren=4

" allows incsearch highlighting for range commands
cnoremap $t <CR>:t''<CR>
cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>``

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"wrapper for JsBeautify

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL MAPPINGS

nnoremap <SPACE> <Nop>
let mapleader = " "

map <Leader>v :e ~/.config/nvim/init.vim
map <Leader>V :e ~/.bash_profile
map <Leader>z :e ~/.zshrc


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

"use to tab or untab entire file
map <leader>= :set noexpandtab<bar>normal ggVG=
map <leader>+ :set expandtab<bar>normal ggVG=

"mru mapping
map <Leader>m :MRU

"map space f to copy current file to clipboard
nmap <Leader>f :let @* = expand("%")<cr>

"toggle background easily
map <Leader>B :let &background = ( &background == "dark"? "light" : "dark" )<CR>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"when doing zl or zh do it 30 spaces instead (horizontal scroll)
nnoremap zl 30zl
nnoremap zh 30zh

"use enter and shift enter to add blank lines without ending up in insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"use ctrl-a and ctrl-e as home and end
:inoremap <C-E> <End>
:inoremap <C-A> <Home>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"airline stuff
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_extensions = [] "faster airline with no extensions

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"this function allows you to visually select lines to perform macro
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
	echo "@".getcmdline()
	execute ":'<,'>normal @".nr2char(getchar())
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"gitgutter stuff
nmap <Leader>ggs <Plug>GitGutterStageHunk
nmap <Leader>ggr <Plug>GitGutterRevertHunk
nmap <Leader>ggp <Plug>GitGutterPreviewHunk
nmap <Leader>ggu <Plug>GitGutterUndoHunk

let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
set updatetime=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"ranger
let g:ranger_map_keys = 0
map <leader>2 :Ranger<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"vim switch stuff for switching boolean values
let g:switch_mapping = "-"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE stuff for linting

let g:ale_python_pylint_use_global = 1
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '?'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" add template paths for gf completing
set path+=~/dev/fluidreview/apps/chide/products/smapply/templates/
set path+=~/dev/fluidreview/apps/chide/products/smapply/mail/templates/
set path+=~/dev/fluidreview/apps/chide/products/reviewroom/templates/
set path+=~/dev/fluidreview/reviewroom/templates/
set path+=~/dev/fluidreview/apps
set path+=~/dev/fluidreview/apps/chide/products/smapply/static/

set path+=~/dev/leagion/assets/js/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"sexy scroller options
"
let g:SexyScroller_ScrollTime = 5
let g:SexyScroller_CursorTime = 5
let g:SexyScroller_MaxTime = 250

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
