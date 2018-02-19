# ZSH_THEME="random"
# ZSH_THEME="eastwood"
# ZSH_THEME="jtriley"
# ZSH_THEME="nanotech"
ZSH_THEME="wezm+"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# alias city
eval "$(hub alias -s)"
alias tls="tmux list-session"
alias t="tugboat"
alias ta="tmux a -t"
alias gc="git checkout"
alias gs="git status"
alias gf="git fetch"
alias gr="git rebase"
alias gp="git pull"
alias gb="git branch"
alias gd="git diff"
alias gl="git log"
alias g="git"
alias gpretty="git log --graph --decorate --oneline \$(git rev-list -g —all)"
alias nombom='npm cache clear && bower cache clean && rm -rf node_modules bower_components && npm install && bower install'
alias git-quiet-pull='git fetch; git stash; git rebase; git stash pop'
alias gqp='git-quiet-pull'
alias gdc='git diff --cached'
alias br='git rev-parse --abbrev-ref HEAD'
alias ls='ls --color=auto'
alias ll='ls -l'
alias l='less'
alias vim='nvim'
alias pbin="curl -F 'f:1=<-' ix.io"
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
