set nocompatible "make sure it's in vim mode
set number "show line numbers
set list " show tab markers
if has('macunix')
	set clipboard=unnamed "let unnamed register be clipboard
else
	set clipboard=unnamedplus "let unnamed register be clipboard
endif
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
set norelativenumber
set mouse=a
setlocal foldmethod=indent
set nocursorcolumn
set nocursorline
set nohlsearch
set termguicolors "truecolors

nnoremap <SPACE> <Nop>
let mapleader = " "

syntax on "turn on syntax highlighting
filetype off
filetype plugin indent on
hi Normal ctermbg=NONE guibg=NONE

"when opening new file, do this stuff
function! SetupEnvironment()
	set tabstop=4
endfunction
autocmd BufNewFile,FileType * call SetupEnvironment()
autocmd BufWritePre * %s/\s\+$//e "trim trailing whitespace

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

"editorconfig
Plug 'editorconfig/editorconfig-vim'

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
Plug 'junegunn/gv.vim'

"status line and other visual
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'

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
Plug 'fisadev/vim-isort'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.config/nvim/bundle/gocode/vim/symlink.sh' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go'
Plug 'Chiel92/vim-autoformat'

"linting
Plug 'w0rp/ale', { 'do':
					\ 'npm install -g eslint@latest;
					\ npm install -g eslint-plugin-babel@latest;
					\ npm install -g babel-eslint@latest'
				\}

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"what vim looks like
let g:gruvbox_contrast_dark="soft"
let g:gruvbox_italic=1
set background=dark
colorscheme gruvbox

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" deoplete tab-complete
let g:deoplete#enable_at_startup = 1
let g:jedi#completions_enabled = 0
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:deoplete#auto_complete_delay=150
let g:omni_sql_no_default_maps = 1 "dont load omnicompletes sql completions (they trip up <C-c>)

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
let g:vim_json_syntax_conceal = 0

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
"recursive macro function

function! RecMacro(cmds)
  let a = @a
  let @a = a:cmds . "@a"
  echo @a
  try
    normal @a
  finally
    let @a = a
  endtry
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"JSX
let g:jsx_ext_required = 0

nmap <Leader>11 0f<f i<cr><Esc>:call RecMacro('0f=l%a<C-v><cr><C-v><Esc>')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Utilities
vnoremap <leader>,rv c<C-O>:set revins<CR><C-R>"<Esc>:set norevins<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"startify
let g:startify_change_to_dir = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL MAPPINGS
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
noremap <Leader>ga :!git add .
noremap <Leader>gs :Gstatus
noremap <Leader>gp :Gpush
noremap <Leader>gd :Gdiff
noremap <Leader>gb :Gblame wM
noremap <Leader>gr :Gread
noremap <Leader>gv :GV
noremap <Leader>gf :GV!

noremap <Leader>gdt :windo diffthis
noremap <Leader>gds :windo diffoff

"vimdiff mappings
noremap <Leader>dp :diffput 4
noremap <Leader>db :windo set nocursorbind noscrollbind
noremap <Leader>dB :windo set cursorbind scrollbind

"map tab manipulation commands
noremap <Leader>tc :tabc<cr>
noremap <Leader>te :tabe<cr>
noremap <Leader>to :tabo<cr>

"map window switching commands
noremap <Leader>k :wincmd k<cr>
noremap <Leader>j :wincmd j<cr>
noremap <Leader>h :wincmd h<cr>
noremap <Leader>l :wincmd l<cr>
noremap <Leader><s-k> :wincmd K<cr>
noremap <Leader><s-j> :wincmd J<cr>
noremap <Leader><s-h> :wincmd H<cr>
noremap <Leader><s-l> :wincmd L<cr>
noremap <Leader><C-k> :split<cr>
noremap <Leader><C-j> :split<cr>
noremap <Leader><C-h> :vsplit<cr>
noremap <Leader><C-l> :vsplit<cr>

map <leader>Q :q!<cr>
map <leader>q :q<cr>
map <leader>w :w<cr>

"bufstop mappings
map <leader>< :BufstopBack<CR>
map <leader>> :BufstopForward<CR>

"easier replacing
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
vnoremap <Leader>s :s/\<<C-r><C-w>\>/

"fzf mappings
map <C-p> :Files
"map \ :Find
map <leader>fg :GFiles
map <leader>fb :Buffers
map <leader>fl :Lines
map <leader>fs :Snippets
map <leader>fc :Commits
map <leader>ff :BCommits
map <leader>fm :MRUFilesCWD
noremap <Leader>fa :Find <C-r><C-w><CR>
noremap <Leader>fA :Find <C-r><C-W><CR>
noremap \ :Ack "
noremap <Leader>\ :Ack -Q "<word>"<CR>

"use to tab or untab entire file
map <leader>= :set noexpandtab<bar>normal ggVG=
map <leader>+ :set expandtab<bar>normal ggVG=

"close all buffers
map <leader>r :1,100bd<cr>

"mru mapping
map <Leader>m :MRU

"map space f to copy current file to clipboard
nmap <Leader>f :let @* = expand("%")<cr>

"toggle background easily
map <Leader>B :let &background = ( &background == "dark"? "light" : "dark" )<CR>

"plug mappings
nmap <leader>pi :source ~/.config/nvim/init.vim <bar> PlugInstall <bar> source ~/.config/nvim/init.vim<cr>
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

"auto expanding
inoremap (; (<CR>);<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap (<CR> (<CR>)<C-c>O
inoremap {; {<CR>};<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap {<CR> {<CR>}<C-c>O
inoremap [; [<CR>];<C-c>O
inoremap [, [<CR>],<C-c>O
inoremap [<CR> [<CR>]<C-c>O

"profile / profiling
nmap <Leader>pstart :profile start profile.log <bar> profile func * <bar> profile file *<cr>
nmap <Leader>pstop :profile pause <bar> noautocmd qall!<cr>
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
"lightline

" Replace filename component of Lightline statusline
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'FilenameForLightline'
      \ }
      \ }

" Show full path of filename
function! FilenameForLightline()
    return expand('%')
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ranger
let g:ranger_map_keys = 0
map <leader>2 :Ranger<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"vim switch stuff for switching boolean values
let g:switch_mapping = "-"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:python_host_prog = '/usr/local/bin/python'
"let g:python3_host_prog = '/usr/local/bin/python3'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE stuff for linting

let g:ale_python_pylint_use_global = 1
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '?'
let g:ale_linters = {'python': ['flake8']}
let g:ale_python_flake8_args="--ignore=W191"
let g:ale_fixers = {
\   'python': ['autopep8'],
\   'javascript': ['eslint'],
\}

"keybindings
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ack stuff
"
let g:ackprg = 'rg --vimgrep --hidden'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ripgrep

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep(
			\'rg --column --line-number --no-heading
			\ --fixed-strings --hidden --no-messages
			\ --glob "!.git/*" --color "always"
			\ '.shellescape(<q-args>), 1, <bang>0)
set grepprg=rg\ --vimgrep

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
