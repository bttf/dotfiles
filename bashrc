# git-aware-prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\u@\h \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# alias city
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
alias ll='ls -l'
alias l='less'
alias paste="curl -F 'f:1=<-' ix.io"
