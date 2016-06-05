# Make sure CXXFLAGS is the same as CFLAGS
export CXXFLAGS=${CFLAGS}

source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh

#prevent tilde expansion
_expand()
{
 return 0
}

PROMPT_GIT_BRANCH='$(__git_ps1 "(%s) ")'
PROMPT_SYSTEM='\n\[\e[30;1m\]Ã¡Â<9a>Â<9c> \[\e[34;1m\]\u@\h\[\e[30;1m\] Ã¡Â<9a>Â<9b>Ã¡Â<9a>Â<9c> \[\e[34;1m\]\j\[\e[30;1m\] Ã¡Â<9a>Â<9b>Ã¡Â<9a>Â<9c> \[\e[34;1m\]\@ \d\[\e[30;1m\] Ã¡Â<9a>Â<9b>\[\e[30;1m\]'
PROMPT_PATH='\[\e[32;1m\]\w'
PROMPT_ERR='$( if [[ $? = 0 ]]; then echo -ne "\[\e[0;32m\]\w $(__git_ps1 "(%s) "):)\[\e[0m\] "; else echo -ne "\[\e[0;31m\]\w $(__git_ps1 "(%s) "):(\[\e[0m\] "; fi; )'
PS1="$PROMPT_ERR"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

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
for d in /Users/calvinc/.npm-packages/*/bin; do PATH="$PATH:$d"; done
export PATH

# for pygraphviz to work
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/Cellar/graphviz/2.38.0/lib/pkgconfig"

# add django bash completion script
. ~/.django_bash_completion.sh

unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

alias manage="reviewroom/project/manage.py"
alias love="/Applications/love.app/Contents/MacOS/love"
alias ssh_frdev='ssh frdev@frdev1.fluidreview.dev'
alias rm_pycs='find . -name "*.pyc" -delete'

alias runfr="manage runserver_plus 3000"
alias runserver="./manage.py runserver_plus 4000"
alias nutri="workon nutrihive; cd ../nutrihive"
alias master="git checkout master"
alias goodssl="/usr/local/opt/openssl/bin/openssl"

cd ~/dev/fluidreview/
workon fr5.1

export VISUAL=vim
export EDITOR="$VISUAL"

# prevent security pin in flask
export WERKZEUG_DEBUG_PIN=off
