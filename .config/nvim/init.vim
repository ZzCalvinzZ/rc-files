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
set shortmess=aFc

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"lsp
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
" Plug 'nvim-lua/diagnostic-nvim'

"language syntax plugins
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'quabug/vim-gdscript'

"visual
Plug 'Yggdroot/indentLine' "show the indent lines as |
Plug 'ap/vim-css-color' "preview css colors
" Plug 'airblade/vim-gitgutter' "TODO remove when coc-git is stable
Plug 'rhysd/git-messenger.vim'
" Plug 'jreybert/vimagit'

"language specific
Plug 'ElmCast/elm-vim'

"useful
Plug 'editorconfig/editorconfig-vim'
Plug 'voldikss/vim-floaterm' " use to float things (lf)
Plug 'rbgrouleff/bclose.vim' " for lf.vim
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
Plug 'AndrewRadev/linediff.vim' "use :Linediff two visual blocks to diff them
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  } "use :MarkdownPreviewToggle


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
" Plug 'shinchu/lightline-gruvbox.vim'
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
" Plug 'ZzCalvinzZ/gruvbox'
" Plug 'rktjmp/lush.nvim', { 'branch': 'main' } 
" Plug 'npxbr/gruvbox.nvim', { 'branch': 'main' }
Plug 'sainnhe/sonokai'


call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"what vim looks like
set background=dark
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

colorscheme sonokai
highlight clear SignColumn

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"commenting
map <C-_> :Commentary<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"COC Language Server Settings

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

nmap <silent> <Leader>cd <Plug>(coc-definition)
nmap <silent> <Leader>ct <Plug>(coc-type-definition)
nmap <silent> <Leader>ci <Plug>(coc-implementation)
nmap <silent> <Leader>ca <Plug>(coc-references)
nmap <Leader>cr <Plug>(coc-rename)
vmap <Leader>cf  <Plug>(coc-format-selected)
nmap <Leader>cf  <Plug>(coc-format)
nmap <Leader>cl  :CocList<CR>
nmap <Leader>cc  :CocCommand<CR>
nmap <Leader>co  :CocList outline<CR>

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
      \'coc-git',
      \'coc-yank',
      \'coc-pairs',
      \'coc-highlight'
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
nmap gu :CocCommand git.chunkUndo<cr>
" show commit ad current position
nmap gc <Plug>(coc-git-commit)
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

augroup cocstuff
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType javascript,typescript,json,python setl formatexpr=CocAction('formatSelected')
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" neovim lsp
""
"" Use <Tab> and <S-Tab> to navigate through popup menu
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"" Set completeopt to have a better completion experience
"set completeopt=menuone,noinsert,noselect

"" Avoid showing message extra message when using completion
"set shortmess+=c

"let g:completion_enable_snippet = 'UltiSnips'

"lua <<EOF

"local on_attach_vim = function(client) 
"  require'completion'.on_attach(client)
"  require'diagnostic'.on_attach(client)
"end

"local custom_attach = function(client)
"	print("LSP started.");
"	require'completion'.on_attach(client)
"	require'diagnostic'.on_attach(client)

"	map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
"	map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
"	map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
"	map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
"	map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
"	map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
"	map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
"	map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
"	map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
"	map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
"	map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
"	map('n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
"	map('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
"	map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
"	map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
"end

"require'nvim_lsp'.tsserver.setup{on_attach=custom_attach}


"EOF

""diagnostics
"let g:diagnostic_virtual_text_prefix = ' '
"nmap [c :PrevDiagnosticCycle<CR>
"nmap ]c :NextDiagnosticCycle<CR>

"call sign_define("LspDiagnosticsErrorSign", {"text" : "E", "texthl" : "LspDiagnosticsError"})
"call sign_define("LspDiagnosticsWarningSign", {"text" : "W", "texthl" : "LspDiagnosticsWarning"})
"call sign_define("LspDiagnosticsInformationSign", {"text" : "I", "texthl" : "LspDiagnosticsInformation"})
"call sign_define("LspDiagnosticsHintSign", {"text" : "H", "texthl" : "LspDiagnosticsHint"})

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
map <Leader>5 :UndotreeToggle<cr>

inoremap <C-c> <esc><esc>

noremap <Leader>D :bp\|bd #<cr>

"map fugitive commands
noremap <Leader>gs :Gstatus<cr>
noremap <Leader>gp :Gpush<cr>
noremap <Leader>gd :Gdiff<cr>
noremap <Leader>gb :Gblame -wM<cr>
noremap <Leader>gr :Gread<cr>
noremap <Leader>gv :GV<cr>
noremap <Leader>gf :GV!<cr>
noremap <Leader>gw :GBrowse<cr>

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

"generate new vertical split
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

" nmap gs <Plug>(GitGutterPreviewHunk)
" nmap gu <Plug>(GitGutterUndoHunk)

" nmap [g <Plug>(GitGutterPrevHunk)
" nmap ]g <Plug>(GitGutterNextHunk)

" let g:gitgutter_realtime = 1
" let g:gitgutter_eager = 1
" set updatetime=250

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"lightline

" Replace filename component of Lightline statusline
let g:lightline = {
      \ 'colorscheme': 'sonokai',
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
"floaterm

let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_opener='edit'
map <leader>2 :FloatermNew lf<CR>

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
let g:vim_json_syntax_conceal = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-polyglot graphql
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
inoremap <S-CR> <CR><C-c>O

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
let g:vrc_show_command = 1

"git-messenger
let g:git_messenger_always_into_popup = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"run code on command
augroup run_commands
  autocmd FileType python nnoremap <buffer> <leader>ce :w !python<cr>
  autocmd FileType javascript nnoremap <buffer> <leader>ce :w !node<cr>
  autocmd FileType sh nnoremap <buffer> <leader>ce :w !sh<cr>
augroup END

let g:python_host_prog = "/Users/calvinc/.pyenv/versions/neovim2/bin/python"
let g:python3_host_prog = "/Users/calvinc/.pyenv/versions/neovim3/bin/python"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" markdown preview
let g:mkdp_auto_start = 0
nmap <leader>6 <Plug>MarkdownPreviewToggle
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
