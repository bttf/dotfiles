source ~/.nvm/nvm.sh

alias tls="tmux list-session"
alias t="tugboat"
alias ta="tmux a -t"
alias gc="git clone"
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
