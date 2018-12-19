set nocompatible "make sure it's in vim mode
set number "show line numbers
if has('macunix')
	set clipboard=unnamed "let unnamed register be clipboard
else
	set clipboard=unnamedplus "let unnamed register be clipboard
endif
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h13
set guioptions+=c "don't use menu popup when it detects new changes in gui
set foldlevelstart=99
set incsearch "incremental search(auto select first match when searching)
set noexpandtab
set tabstop=4
set shiftwidth=4
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
set cursorline
set nohlsearch "highlight entries when searching
set termguicolors "truecolors
set splitright

nnoremap <SPACE> <Nop>
let mapleader = " "
let &t_ut=''

syntax on "turn on syntax highlighting
filetype off
filetype plugin indent on
hi Normal ctermbg=NONE guibg=NONE

fun! StripTrailingWhitespace()
    " Don't strip on these filetypes
    if &ft =~ 'snippets'
        return
    endif
    %s/\s\+$//e
endfun

autocmd BufWritePre * call StripTrailingWhitespace()

"better colors when using as diff
if &diff
	hi DiffText   cterm=none ctermfg=Black ctermbg=Red gui=none guifg=Black guibg=Red
	hi DiffChange cterm=none ctermfg=Black ctermbg=LightMagenta gui=none guifg=Black guibg=LightMagenta
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/bundle')

Plug 'junegunn/vim-plug'

"Neovim
Plug 'lambdalisue/suda.vim'

"language syntax plugins
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'neovimhaskell/haskell-vim'
Plug 'othree/html5.vim'
Plug 'tbastos/vim-lua'
Plug 'hdima/python-syntax'
Plug 'keith/tmux.vim'
Plug 'isRuslan/vim-es6'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'kchmck/vim-coffee-script'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mitsuhiko/vim-jinja'
Plug 'mxw/vim-jsx'
Plug 'ekalinin/Dockerfile.vim'
Plug 'prabirshrestha/async.vim'
Plug 'Yggdroot/indentLine'
Plug 'quabug/vim-gdscript'
Plug 'jparise/vim-graphql'

"editorconfig
Plug 'editorconfig/editorconfig-vim'

Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'

"useful
Plug 'simeji/winresizer'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-rhubarb'

" Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'wellle/targets.vim'
Plug 'kshenoy/vim-signature' "for showing marks in the gutter
Plug 'AndrewRadev/switch.vim' "swapping booleans
Plug 'ap/vim-css-color'
Plug 'mihaifm/bufstop' "for switching buffers easily
Plug 'junegunn/vim-easy-align'
Plug 'Olical/vim-enmasse' "use to edit all results from Ack in a buffer
Plug 'janko-m/vim-test'

"Zeal
Plug 'KabbAmine/zeavim.vim'

"tmux
Plug 'christoomey/vim-tmux-navigator'

"git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

"status line and other visual
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'mhinz/vim-startify'

"code scratchpad
Plug 'metakirby5/codi.vim'

"snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'joaohkfaria/vim-jest-snippets'

Plug 'michaeljsmith/vim-indent-object'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'yegappan/mru'

"colors
Plug 'morhetz/gruvbox'

"Autocomplete and related
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'fisadev/vim-isort'

Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.config/nvim/bundle/gocode/vim/symlink.sh' }
Plug 'fatih/vim-go'

"linting
 Plug 'w0rp/ale', { 'do':
 					\ 'npm install -g eslint@latest;
 					\ npm install -g prettier@latest;
 					\ npm install -g stylelint@latest;
 					\ npm install -g eslint-plugin-babel@latest;
 					\ npm install -g babel-eslint@latest;
 					\ npm install -g eslint-plugin-react@latest;
 					\ npm install -g eslint-plugin-jest@latest;
 					\ npm install -g eslint-plugin-prettier@latest;
					\ npm install -g eslint-plugin-jsx-control-statements;
 					\ npm install -g eslint-plugin-graphql@latest'
 				\}

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"what vim looks like
let g:gruvbox_contrast_dark="soft"
" let g:gruvbox_contrast_light="soft"
let g:gruvbox_italic=1
set background=dark
colorscheme gruvbox

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"commenting
map <C-_> :Commentary<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"coc.nvim

" Better display for messages
set cmdheight=2

inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <C-p> to complete 'word', 'emoji' and 'include' sources
imap <silent> <C-p> <Plug>(coc-complete-custom)

" Use <cr> for confirm completion.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"

" remap gotos
nmap <silent> <Leader>cd <Plug>(coc-definition)
nmap <silent> <Leader>cy <Plug>(coc-type-definition)
nmap <silent> <Leader>ci <Plug>(coc-implementation)
nmap <silent> <Leader>cr <Plug>(coc-references)
" nmap <silent> <Leader>cf <Plug>(coc-format)
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
vmap <silent> <Leader>cf <Plug>(coc-format-selected)
nnoremap <silent> <Leader>ck :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Show signature help while editing
autocmd CursorHoldI,CursorMovedI * silent! call CocAction('showSignatureHelp')

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

let g:omni_sql_no_default_maps = 1 "dont load omnicompletes sql completions (they trip up <C-c>)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"for vim-javascript to show html and css highlighting
let javascript_enable_domhtmlcss=1

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-h>"
map <Leader>u :UltiSnipsEdit<cr>
let g:UltiSnipsEditSplit="vertical" "If you want :UltiSnipsEdit to split your window.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set this to the value of shiftwidth
let g:pyindent_open_paren=4

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
map <Leader>vv :e ~/.config/nvim/init.vim<cr>
map <Leader>vz :e ~/.zshrc<cr>
map <Leader>vt :e ~/.tmux.conf<cr>
map <Leader>vm :e ~/.start_tmuxinator.sh<cr>
map <Leader>va :e ~/.aliases<cr>

"map plugin commands
map <Leader>2 :NERDTreeFind<cr>
map <Leader>3 :NERDTreeToggle<cr>
map <Leader>5 :UndotreeToggle<cr>

inoremap <C-c> <esc>

"noremap <Leader>D :BufSurfBack
noremap <Leader>D :bp\|bd #<cr>

"map fugitive commands
noremap <Leader>ga :!git add .<cr>
noremap <Leader>gs :Gstatus<cr>
noremap <Leader>gp :Gpush<cr>
noremap <Leader>gd :Gdiff<cr>
noremap <Leader>gb :Gblame wM<cr>
noremap <Leader>gr :Gread<cr>
noremap <Leader>gv :GV<cr>
noremap <Leader>gf :GV!<cr>

noremap <Leader>gdt :windo diffthis<cr>
noremap <Leader>gds :windo diffoff<cr>

"vimdiff mappings
noremap <Leader>dp :diffput 4<cr>
noremap <Leader>db :windo set nocursorbind noscrollbind<cr>
noremap <Leader>dB :windo set cursorbind scrollbind<cr>

"map tab manipulation commands
noremap <Leader>tc :tabc<cr>
noremap <Leader>te :tabe<cr>
noremap <Leader>to :tabo<cr>

"map window switching commands
noremap <Leader><s-k> :wincmd K<cr>
noremap <Leader><s-j> :wincmd J<cr>
noremap <Leader><s-h> :wincmd H<cr>
noremap <Leader><s-l> :wincmd L<cr>

" vv to generate new vertical split
map <C-\> <C-w>v
nmap <C-r> :WinResizerStartResize<cr>

map <leader>Q :q!<cr>
map <leader>q :q<cr>
map <leader>w :w<cr>

"bufstop mappings
map <leader>< :BufstopBack<CR>
map <leader>> :BufstopForward<CR>

"fzf mappings
map <C-p> :Files<cr>
"map \ :Find<cr>
map <leader>fg :GFiles<cr>
map <leader>fb :Buffers<cr>
map <leader>fl :Lines<cr>
map <leader>fs :Snippets<cr>
map <leader>fc :Commits<cr>
map <leader>ff :BCommits<cr>
map <leader>fm :MRUFilesCWD<cr>
noremap <Leader>fa :Find <C-r><C-w><CR>
noremap <Leader>fA :Find <C-r><C-W><CR>
noremap \ :Ack! "
noremap <Leader>\ :Ack! "<cword>"<CR>

"use to tab or untab entire file
map <leader>= :set noexpandtab<bar>normal ggVG=<cr>
map <leader>+ :set expandtab<bar>normal ggVG=<cr>

"close all buffers
map <leader>r :1,100bd<cr>

"mru mapping
map <Leader>m :MRU<cr>

"toggle background easily
map <Leader>B :let &background = ( &background == "dark"? "light" : "dark" )<CR>

"plug mappings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"when doing zl or zh do it 30 spaces instead (horizontal scroll)
nnoremap zl 30zl
nnoremap zh 30zh

"use ctrl-a and ctrl-e as home and end
:inoremap <C-E> <End>
:inoremap <C-A> <Home>

"profile / profiling
nmap <Leader>/pstart :profile start profile.log <bar> profile func * <bar> profile file *<cr>
nmap <Leader>/pstop :profile pause <bar> noautocmd qall!<cr>

"restart language server
map <Leader>9 :CocRestart<cr>

"add missing dependencies
map <Leader>8 :!pip install neovim flake8 python-language-server<cr>

map <Leader>9 :!install_local_eslint<cr>

"mapping to swap visually. Delete something, then hit visually select, then
"hit <C-x> to swap
vnoremap <C-X> <Esc>`.``gvP``P
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
      \ 'colorscheme': 'gruvbox',
      \ 'component_function': {
      \   'filename': 'FilenameForLightline',
      \   'cocstatus': 'coc#status'
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ }
      \}

" copy full path of filename
function! FilenameForLightline()
    return expand('%')
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ranger
let g:ranger_map_keys = 0
map <leader>2 :Ranger<CR>
let g:ranger_replace_netrw = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"vim switch stuff for switching boolean values
let g:switch_mapping = "-"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ack stuff
"
let g:ackprg = 'rg --vimgrep --hidden -i -j1'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ripgrep
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
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"
"save as root
command! -nargs=0 Sw w suda://%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"indents
let g:indentLine_char = '▏'
set list " show tab markers
set listchars=tab:\▏\ ,trail:·
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"file mappings
"open file in browser
"nnoremap <leader>fb :exe ':silent !chromium %'<CR>
"map space f to copy current file to clipboard
nmap <Leader>fn :let @+ = expand("%")<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ScratchpadThisFiletype()
	execute 'edit' '~/temp/temp.'.expand('%:e')
	Codi
endfunction
command! Scratch call ScratchpadThisFiletype()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Codi
function! PP_js(line)
	" Strip escape codes
	return substitute(a:line, "\<esc>".'\[\d\(\a\|\dm\)', '', 'g')
endfunction

let g:codi#interpreters = {
	\ 'typescript': {
		\ 'bin': 'ts-node',
		\ 'prompt': '^\(>\|\.\.\.\+\) ',
		\ 'preprocess': function('PP_js'),
		\ },
	\ }

let g:codi#rightalign = 0
nmap <Leader>cc :Codi!!<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-test
nmap <Leader>ct :TestNearest<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-highlightedyank
let g:highlightedyank_highlight_duration = 150
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_json_syntax_conceal = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-graphql
let g:graphql_javascript_tags = [".. GraphQL .. ", "gql", "graphql", "Relay.QL"]

"TODO remove when I get a chance
" Plug 'python-mode/python-mode', { 'do': 'git submodule update --init --recursive' }
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Plug 'zchee/deoplete-go', { 'do': 'make'}
"
" Plug 'autozimu/LanguageClient-neovim', {
" 	\ 'branch': 'next',
" 	\ 'do':
" 		\ 'bash install.sh;
" 		\ npm install -g typescript-language-server@latest;
" 		\ npm install -g typescript@latest;
" 		\ npm install -g jest@latest;
" 		\ npm install -g ts-node@latest;
" 		\ gem install rubocop solargraph'
" 	\ }
"
" deoplete tab-complete
" let g:deoplete#enable_at_startup = 1
" inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<TAB>"
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" call deoplete#custom#source('ultisnips', 'rank', 9999)
" let g:deoplete#auto_complete_delay=150

"jedi and tern stuff
 " let g:LanguageClient_serverCommands = {
 "     \ 'javascript': ['typescript-language-server', '--stdio'],
 "     \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
 "     \ 'typescript': ['typescript-language-server', '--stdio'],
 "     \ 'typescript.tsx': ['typescript-language-server', '--stdio'],
 "     \ 'python': ['pyls'],
 "     \ 'ruby': ['solargraph', 'stdio'],
 "     \ }
" nmap <silent> <Leader>ck :call LanguageClient_textDocument_hover()<CR>
" nmap <silent> <Leader>cd :call LanguageClient_textDocument_definition()<CR>
" nmap <silent> <Leader>cR :call LanguageClient_textDocument_rename()<CR>
" nmap <silent> <Leader>cs :call LanguageClient_textDocument_documentSymbol()<CR>
" nmap <silent> <Leader>cw :call LanguageClient_workspace_symbol()<CR>
" nmap <silent> <Leader>cr :call LanguageClient_textDocument_references()<CR>

" let g:LanguageClient_diagnosticsEnable = 0
" let g:LanguageClient_diagnosticsList = "Location"

" let g:LanguageClient_loadSettings = 1
" let g:LanguageClient_rootMarkers = ['.git']

" let g:pymode_warnings = 1
" let g:pymode_trim_whitespaces = 0
" let g:pymode_options = 0
" let g:pymode_indent = 0
" let g:pymode_folding = 0
" let g:pymode_doc = 0
" let g:pymode_run = 0
" let g:pymode_breakpoint = 0
" let g:pymode_lint = 0
" let g:pymode_rope_completion = 0

" let g:pymode_rope = 1
" let g:pymode_rope_regenerate_on_write = 0
" let g:pymode_rope_goto_definition_cmd = 'e'
" let g:pymode_rope_goto_definition_bind = '<leader>cg'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE stuff for linting
let g:ale_javascript_eslint_use_global = 1
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '?'
let g:ale_linters = {
\   'python': ['flake8'],
\   'javascript': ['eslint'],
\   'javascript.jsx': ['eslint'],
\   'graphql': ['eslint'],
\}
let g:ale_python_flake8_args="--ignore=W191,W503"
let g:ale_fix_on_save = 0
let g:ale_fixers = {
\   'python': ['autopep8'],
\   'ruby': ['rubocop'],
\   'javascript': ['prettier-eslint'],
\   'typescript': ['prettier-eslint'],
\   'json': ['prettier'],
\   'scss': ['prettier'],
\   'xml': ['prettier'],
\   'html': ['prettier'],
\   'graphql': ['prettier'],
\}

"keybindings
nmap <silent>[f <Plug>(ale_previous_wrap)
nmap <silent>]f <Plug>(ale_next_wrap)
nmap <silent><Leader>cf :ALEFix<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
