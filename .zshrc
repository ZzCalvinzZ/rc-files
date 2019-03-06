# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#virtualenvwrapper
source $(dirname "$(which virtualenv).virtualenvwrapper.sh")

# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

# allows you to type Bash style comments on your command line
# good 'ol Bash
setopt interactivecomments

# disable autocorrect suggestions
unsetopt correct_all

export TERM="xterm-256color"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f /usr/share/fzf/key-bindings.zsh ]; then
	source /usr/share/fzf/key-bindings.zsh
fi
if [ -f /usr/share/fzf/completion.zsh ]; then
	source /usr/share/fzf/completion.zsh
fi

source ~/notifyosd.zsh

source ~/.aliases.zsh

#################### ENVS #######################################
#
# Virtual envs
export WORKON_HOME=~/Envs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2

#Go
go() {
  export GOPATH="$HOME/dev/go"
  export PATH=$PATH:$(go env GOPATH)/bin # go
  go "$@"
}

#Android
# export ANDROID_HOME=${HOME}/Library/Android/sdk
# export PATH=${PATH}:${ANDROID_HOME}/tools
# export PATH=${PATH}:${ANDROID_HOME}/platform-tools

PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH" # ruby
PATH="$PATH:/home/calvin/.local/bin" #User pip
PATH="$HOME/.yarn/bin:/usr/local/bin/:$PATH:$HOME/.config/yarn/global/node_modules/.bin/" #yarn

export PATH
##################################################################

export VISUAL=nvim
export EDITOR="$VISUAL"
export TERMINAL=kitty

# prevent security pin in flask
export WERKZEUG_DEBUG_PIN=off

# react native expo
export REACT_NATIVE_PACKAGER_HOSTNAME="192.168.0.61"

#fzf ripgrep
export FZF_DEFAULT_COMMAND='rg --files --hidden --no-messages --glob "!.git/*"'
export TERMINAL=alacritty

export BROWSER=firefox-developer-edition

#
export REVIEW_BASE=master

# node versioning
export NVS_HOME="$HOME/.nvs"
[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"

#jira autocomplete
eval "$(jira --completion-script-zsh)"
