set nocompatible "make sure it's in vim mode
set number "show line numbers
if has('macunix')
    set clipboard=unnamed "let unnamed register be clipboard
else
    set clipboard=unnamedplus "let unnamed register be clipboard
endif
set guioptions+=c "don't use menu popup when it detects new changes in gui
set foldlevelstart=99
set incsearch "incremental search(auto select first match when searching)
set noexpandtab
set tabstop=4
set shiftwidth=4
set ignorecase "this will ignore case unless explicitly searching with capitals
set smartcase
set wildmode=longest,list,full "Shows menu items when tabbing for autocomplete
set nowrap "don't wrap text when it doesn't fit in the window
set undofile "persistent undo for when vim is closed
set history=10000 "the amount of : commands saved
set undolevels=10000 "the amount undo levels saved
set nostartofline "keep the cursor on the same column when changing lines
set inccommand=nosplit "live substitution
set showcmd "shows last command made
set nobackup
set noswapfile
set undodir=~/.config/.nvim/undo//
" set diffopt=vertical "make diffs appear side by side
set hidden "don't close file (hide it in a buffer)
set norelativenumber
set mouse=a
setlocal foldmethod=indent
set nocursorcolumn
set cursorline
set nohlsearch "highlight entries when searching
set splitright

"Truecolors
set termguicolors
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"

"Leader
nnoremap <SPACE> <Nop>
let mapleader = " "
let &t_ut=''

" syntax on "turn on syntax highlighting
filetype off
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/bundle')

"junegunn
Plug 'junegunn/vim-plug'
Plug 'junegunn/gv.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'

"root file saving
Plug 'lambdalisue/suda.vim'

"autocomplete
Plug 'prabirshrestha/async.vim'

"coc
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

"language syntax plugins
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'quabug/vim-gdscript'

"visual
Plug 'Yggdroot/indentLine' "show the indent lines as |
Plug 'ap/vim-css-color' "preview css colors
Plug 'machakann/vim-highlightedyank' "highlights what you yank
" Plug 'airblade/vim-gitgutter' TODO remove when coc-git is stable
Plug 'rhysd/git-messenger.vim'
Plug 'jreybert/vimagit'

Plug 'jparise/vim-graphql'

"language specific
Plug 'ElmCast/elm-vim'

"useful
Plug 'editorconfig/editorconfig-vim'
Plug 'francoiscabrol/ranger.vim' "use ranger file manager
Plug 'rbgrouleff/bclose.vim' " for ranger.vim
Plug 'mbbill/undotree' "visual representation of undo history
Plug 'simeji/winresizer' "resize window with <leader>r
Plug 'vim-scripts/ReplaceWithRegister' "use 'gr' to paste
Plug 'Olical/vim-enmasse' "use to edit all results from Ack in a buffer
Plug 'wellle/targets.vim' "extra vim text objects
Plug 'michaeljsmith/vim-indent-object' "indent object
Plug 'AndrewRadev/switch.vim' "swapping booleans
Plug 'kshenoy/vim-signature' "for showing marks in the gutter
Plug 'mihaifm/bufstop' "for switching buffers easily
Plug 'vim-scripts/argtextobj.vim' " Function arguments as text objects: ia, aa
Plug 'mattn/emmet-vim' "simple html creation

"tpope
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dadbod'

"tmux
Plug 'christoomey/vim-tmux-navigator'

"status line and other visual
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'mhinz/vim-startify'

"snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'joaohkfaria/vim-jest-snippets'
Plug 'isRuslan/vim-es6'

Plug 'mileszs/ack.vim'
Plug 'yegappan/mru'

"rest client
Plug 'diepm/vim-rest-console'

"colors
Plug 'ZzCalvinzZ/gruvbox'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"what vim looks like
let g:gruvbox_contrast_dark="soft"
" let g:gruvbox_contrast_light="soft"
let g:gruvbox_italic=1
set background=dark
colorscheme gruvbox
highlight clear SignColumn

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"commenting
map <C-_> :Commentary<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Language Server Settings

" Better display for messages
set cmdheight=2

inoremap <expr><C-j> pumvisible() ? "\<Down>" : "\<C-j>"
inoremap <expr><C-k> pumvisible() ? "\<Up>" : "\<C-k>"
inoremap <expr><cr> pumvisible() ? "\<C-y>" : "\<cr>"
inoremap <expr><TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_smart_completion = 1

"preview window on autocomplete
set completeopt+=preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

inoremap <silent><expr> <c-space> coc#refresh()

function! FormatThenSave()
  Format
  write
endfunction


nmap <silent> <Leader>cd <Plug>(coc-definition)
nmap <silent> <Leader>ct <Plug>(coc-type-definition)
nmap <silent> <Leader>ci <Plug>(coc-implementation)
nmap <silent> <Leader>ca <Plug>(coc-references)
nmap <Leader>cr <Plug>(coc-rename)
vmap <Leader>cf  <Plug>(coc-format-selected)
nmap <Leader>cf  <Plug>(coc-format)
nmap <Leader>cw  :call FormatThenSave()<CR>
nmap <Leader>cl  :CocList<CR>
nmap <Leader>cc  :CocCommand<CR>

let g:coc_global_extensions = [
      \'coc-tsserver',
      \'coc-eslint',
      \'coc-jest',
      \'coc-prettier',
      \'coc-json',
      \'coc-stylelint',
      \'coc-css',
      \'coc-python',
      \'coc-emmet',
      \'coc-html',
      \'coc-yaml',
      \'coc-solargraph',
      \'coc-highlight',
      \'coc-snippets',
      \'coc-git'
      \]

"format on save
" autocmd BufWritePre *.js,*.scss,*.sass,*.json,*.graphql,*.md,*.yaml :call CocAction('format')

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)

" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit ad current position
nmap gc <Plug>(coc-git-commit)

augroup cocstuff
  autocmd!
  " Setup formatexpr specified filetype(s).
  " autocmd FileType typescript,json,python setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

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

noremap <Leader>D :bp\|bd #<cr>

"map fugitive commands
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
nnoremap <C-\> <C-w>v
nmap <leader>r :WinResizerStartResize<cr>

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
"TODO remove when coc-git is stable
" nmap <Leader>ggs <Plug>GitGutterStageHunk
" nmap <Leader>ggr <Plug>GitGutterRevertHunk
" nmap <Leader>ggp <Plug>GitGutterPreviewHunk
" nmap <Leader>ggu <Plug>GitGutterUndoHunk

" let g:gitgutter_realtime = 1
" let g:gitgutter_eager = 1
" set updatetime=250

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"lightline

" Replace filename component of Lightline statusline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'component_function': {
      \   'filename': 'FilenameForLightline',
      \   'cocstatus': 'coc#status',
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ],
      \   'right': [[]]
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
"vim-test
nmap <Leader>ct :TestNearest<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-highlightedyank
let g:highlightedyank_highlight_duration = 150
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_json_syntax_conceal = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-graphql
let g:graphql_javascript_tags = [".. GraphQL .. ", "gql",  "gql ", "graphql", "Relay.QL"]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tmux-navigator
let g:tmux_navigator_disable_when_zoomed = 1
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" elm
let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"hacks
let g:omni_sql_no_default_maps = 1 "dont load omnicompletes sql completions (they trip up <C-c>)

" better colors when using as diff
if &diff
  " bg #32302f
  hi DiffAdd guibg=#394739 guifg=NONE cterm=NONE gui=NONE ctermfg=NONE ctermbg=236
  hi DiffDelete guibg=#511f1f guifg=NONE cterm=NONE gui=NONE ctermfg=NONE ctermbg=236
  hi DiffChange guibg=#24274f guifg=NONE cterm=NONE gui=NONE ctermfg=NONE ctermbg=236
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"auto close {
inoremap (<CR> (<CR>)<C-c>O
inoremap {<CR> {<CR>}<C-c>O
inoremap [<CR> [<CR>]<C-c>O

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"fugitive/ rhubarb
let g:github_enterprise_urls = ['https://code.corp.surveymonkey.com']

"rest client
let g:vrc_curl_opts = {
  \ '-sS': '',
  \ '--connect-timeout': 10,
  \ '-i': '',
  \ '--max-time': 60,
  \ '-k': '',
  \}
let g:vrc_trigger = '<C-n>'

"git-messenger
let g:git_messenger_always_into_popup = 1
