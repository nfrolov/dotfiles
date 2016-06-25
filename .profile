export EDITOR=vim
export VISUAL=vim

export NVM_DIR=$(test -d ~/.nvm && cd ~/.nvm && pwd -P)
[ -f "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export RVM_DIR=$(test -d ~/.rvm && cd ~/.rvm && pwd -P)
[ -f "$RVM_DIR/scripts/rvm" ] && . "$RVM_DIR/scripts/rvm"
