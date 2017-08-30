#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# nvm
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/creationix/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
) && . "$NVM_DIR/nvm.sh"

# bashrc
cat $DIR/bashrc >> ~/.bashrc
source ~/.bashrc

# vim
mkdir -p ~/.vim/{_tmp,backup}
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s $DIR/vimrc ~/.vimrc
vim +PluginInstall +qall

# silversearcher
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo apt-get install silversearcher-ag
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew install the_silver_searcher
fi

# git-aware-prompt
mkdir ~/.bash
cd ~/.bash
git clone git://github.com/jimeh/git-aware-prompt.git

# tmux
if [ -f ~/.tmux.conf ]; then
  cat $DIR/tmux.conf >> ~/.tmux.conf
else
  cp $DIR/tmux.conf ~/.tmux.conf
fi
