#!/bin/bash

# git branch prompt for PS1
txtred="$(tput setaf 1 2>/dev/null || echo '\e[0;31m')"  # Red

find_git_branch() {
  # Based on: http://stackoverflow.com/a/13003854/170413
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi
    git_branch=" ($branch)"
  else
    git_branch=""
  fi
}

PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"
export PS1="\[\033[38;5;70m\]\d\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;70m\]\t\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;248m\]\W\[$(tput sgr0)\]\[\033[38;5;159m\]\$git_branch\[\$txtred\]\$git_dirty \[$(tput sgr0)\]\[\033[38;5;57m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] "

# For MacOS; ls w/ color
# export CLICOLOR=1

# For nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# For hub
# eval "$(hub alias -s)"

alias tls="tmux list-session"
alias ta="tmux a -t"
alias gc="git checkout"
alias gs="git status"
alias gf="git fetch"
alias gr="git rebase"
alias gp="git pull"
alias gpp="git push origin HEAD"
alias gb="git branch"
alias gd="git diff"
alias gdd="git diff -- . ':(exclude)*__generated__*'"
alias gdc='git diff --cached'
alias gdcc="git diff --cached -- . ':(exclude)*__generated__*'"
alias gl="git log"
alias g="git"
alias grw="git reset --soft HEAD~1"
alias gppf="gpp --force-with-lease"
alias ll='ls -l'
alias l='less'
alias ..="cd .."
alias ...="cd ../../.."
