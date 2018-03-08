#################### PATHS #######################################
# Virtual envs
export WORKON_HOME=~/Envs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2

#Node
NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"
PATH=~/.npm-global/bin:$PATH

#Android
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

#MacPorts
PATH="/opt/local/bin:/opt/local/sbin:$PATH"

#Brew stuff
PATH="/usr/local/Cellar/python/2.7.9/bin:$PATH"
PATH="$PATH:/usr/local/Cellar/gettext/0.19.2/bin"
PATH="$PATH:/usr/local/Cellar/graphviz/2.38.0/include/graphviz"

#for pdfconvert2 (needed in Fluidreview)
PATH="$HOME/bin:$PATH"

export PATH

##################################################################

# for pygraphviz to work
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/Cellar/graphviz/2.38.0/lib/pkgconfig"

#reviewroom environment variables
export FR_PATH=~/dev/fluidreview/

export VISUAL=nvim
export EDITOR="$VISUAL"
export TERMINAL=kitty

# prevent security pin in flask
export WERKZEUG_DEBUG_PIN=off
