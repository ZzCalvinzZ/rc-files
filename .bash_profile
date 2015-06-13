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
PROMPT_ERR='$( if [[ $? = 0 ]]; then echo -ne "\[\e[01;34m\]\w $(__git_ps1 "(%s) "):)\[\e[0m\] "; else echo -ne "\[\e[01;31m\]\w $(__git_ps1 "(%s) "):(\[\e[0m\] "; fi; )'
PS1="$PROMPT_ERR"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh

# Make sure CXXFLAGS is the same as CFLAGS
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# MacPorts Installer addition on 2015-03-24_at_12:36:10: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

PATH="/usr/local/Cellar/python/2.7.9/bin:$PATH"

~/.django_bash_completion.sh

NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

PATH="$NPM_PACKAGES/bin:$PATH"
PATH="$HOME/bin:$PATH"
PATH="$PATH:/usr/local/Cellar/gettext/0.19.2/bin"
for d in /Users/calvinc/.npm-packages/*/bin; do PATH="$PATH:$d"; done
# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

alias manage="reviewroom/project/manage.py"
alias git="git --no-pager"

cd ~/Dev/fluidware/
workon fr5.1


