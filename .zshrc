# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/calvinc/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git django virtualenvwrapper rand-quote)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh

#lots of Node stuff
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

#MacPorts
PATH="/opt/local/bin:/opt/local/sbin:$PATH"

#other paths
PATH="/usr/local/Cellar/python/2.7.9/bin:$PATH"
PATH="$NPM_PACKAGES/bin:$PATH"
PATH="$HOME/bin:$PATH"
PATH="$PATH:/usr/local/Cellar/gettext/0.19.2/bin"
PATH="$PATH:/usr/local/Cellar/graphviz/2.38.0/include/graphviz"
for d in /Users/calvinc/.npm-packages/bin/*; do PATH="$PATH:$d"; done
export PATH

# for pygraphviz to work
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/Cellar/graphviz/2.38.0/lib/pkgconfig"

unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

#node local exec alias
alias npm-exec='PATH=$(npm bin):$PATH'

#reviewroom aliases
alias manage="reviewroom/project/manage.py"
alias roadrunner="~/dev/devutils/roadrunner/roadrunner.sh 127.0.0.1 3000"
alias bugfixer="~/dev/devutils/bugfixer/bugfixer.sh"
alias ssh_frdev='ssh frdev@frdev1.fluidreview.dev'
alias frrun="manage runserver_plus 3000"
alias frshell="manage shell_plus"
alias runserver="./manage.py runserver_plus 4000"
alias t1="ssh frdev@frdev1.fluidreview.dev"

#roguelike
alias rogue="workon roguelike; cd ~/dev/stuff/roguelike"

#misc aliases
alias love="/Applications/love.app/Contents/MacOS/love"
alias rm_pycs='find . -name "*.pyc" -delete'
alias habble="workon habble; cd ../habble"
alias habblerun="./manage.py runserver_plus"
alias goodssl="/usr/local/opt/openssl/bin/openssl"
alias profile="vim ~/.bash_profile"
alias tag="ctags -R --exclude='*js'"
alias cvim="vim --cmd 'let g:useAutoComplete=1'"

alias picturepay="workon picturepay; cd ~/dev/stuff/picturepay"
alias homepage="workon homepage; cd ~/dev/stuff/homepage"

alias rrpid="lsof -i tcp:3000"

cd ~/dev/fluidreview/
workon fr

#reviewroom environment variables
export FR_PATH=~/dev/fluidreview/

export VISUAL=vim
export EDITOR="$VISUAL"

# prevent security pin in flask
export WERKZEUG_DEBUG_PIN=off

TERM=screen-256color

#fzf stufffffff

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## fbr - checkout git branch (including remote branches)
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

#POWERLEVEL9000 options
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)

POWERLEVEL9K_VIRTUALENV_BACKGROUND='white'
