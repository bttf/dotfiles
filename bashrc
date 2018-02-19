# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# alias city
eval "$(hub alias -s)"
alias t="tugboat"
alias tls="tmux list-session"
alias ta="tmux a -t"
alias gc="git checkout"
alias gs="git status"
alias gp="git pull"
alias gb="git branch"
alias gd="git diff"
alias gl="git log"
alias g="git"
alias nombom='npm cache clear && bower cache clean && rm -rf node_modules bower_components && npm install && bower install'
alias gdc='git diff --cached'
alias ls='ls --color=auto'
alias ll='ls -l'
alias l='less'
alias vim='nvim'
alias pbin="curl -F 'f:1=<-' ix.io"
