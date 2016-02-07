export NVM_DIR=$(readlink -f "$HOME/.nvm")
[ -f "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -f "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

export RVM_DIR=$(readlink -f "$HOME/.rvm")
[ -f "$RVM_DIR/scripts/rvm" ] && . "$RVM_DIR/scripts/rvm"
[ -f "$RVM_DIR/scripts/completion" ] && . "$RVM_DIR/scripts/completion"
