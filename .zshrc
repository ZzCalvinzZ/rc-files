# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# plugins=(git django virtualenvwrapper tmuxinator golang docker extract docker-compose docker-machine zsh-syntax-highlighting github)

#virtualenvwrapper
source $(dirname "$(which virtualenv).virtualenvwrapper.sh")

# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

# allows you to type Bash style comments on your command line
# good 'ol Bash
setopt interactivecomments

# disable autocorrect suggestions
unsetopt correct_all

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export TERM="xterm-256color"

# Source my aliases file
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

if [ -f /usr/share/fzf/key-bindings.zsh ]; then
	source /usr/share/fzf/key-bindings.zsh
fi
if [ -f /usr/share/fzf/completion.zsh ]; then
	source /usr/share/fzf/completion.zsh
fi

source ~/notifyosd.zsh


#################### PATHS #######################################
#
# Virtual envs
export WORKON_HOME=~/Envs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2

#Node
# NPM_PACKAGES="${HOME}/.npm-packages"
# NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
# PATH="$NPM_PACKAGES/bin:$PATH"
# PATH=~/.npm-global/bin:$PATH

#nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#Android
# export ANDROID_HOME=${HOME}/Library/Android/sdk
# export PATH=${PATH}:${ANDROID_HOME}/tools
# export PATH=${PATH}:${ANDROID_HOME}/platform-tools

#Go
export GOPATH="$HOME/dev/go"
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
PATH=$PATH:$(go env GOPATH)/bin

#User pip
PATH="$PATH:/home/calvin/.local/bin"


#yarn
PATH="$HOME/.yarn/bin:/usr/local/bin/:$PATH:$HOME/.config/yarn/global/node_modules/.bin/"

export PATH
##################################################################

# for pygraphviz to work
# export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/Cellar/graphviz/2.38.0/lib/pkgconfig"

#reviewroom environment variables
# export FR_PATH=~/dev/fluidreview/

export VISUAL=nvim
export EDITOR="$VISUAL"
export TERMINAL=kitty

# prevent security pin in flask
export WERKZEUG_DEBUG_PIN=off

# react native expo
export REACT_NATIVE_PACKAGER_HOSTNAME="192.168.0.61"

#fzf ripgrep
export FZF_DEFAULT_COMMAND='rg --files --hidden --no-messages --glob "!.git/*"'
export TERMINAL=kitty

# browser
export BROWSER=chromium
