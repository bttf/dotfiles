#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

linkup() {
  if [ ! -h $2 ]; then
    ln -sn $1 $2
  fi
  return
}

# nvm
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/creationix/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
)

# nvim
mkdir -p $HOME/.local/share
mkdir -p $HOME/.config/nvim
linkup $DIR/nvim $HOME/.local/share/nvim
linkup $DIR/nvim/init.vim $HOME/.config/nvim/init.vim
# install plug
if [ ! -f $DIR/nvim/site/autoload/plug.vim ]; then
  curl -fLo $DIR/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
# Install nvim plugins
nvim +PlugInstall +qall

# tmux
linkup $DIR/tmux/tmux.conf $HOME/.tmux.conf

# tpm
mkdir -p $HOME/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
