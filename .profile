export NVM_DIR=$(readlink -f "$HOME/.nvm")
[ -f "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export RVM_DIR=$(readlink -f "$HOME/.rvm")
[ -f "$RVM_DIR/scripts/rvm" ] && . "$RVM_DIR/scripts/rvm"
