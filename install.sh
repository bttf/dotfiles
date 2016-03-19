#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# nvm
git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
. ~/.nvm/nvm.sh

# bashrc
cat $DIR/bashrc >> ~/.bashrc
source ~/.bashrc

# vim
mkdir -p ~/.vim/{_tmp,backup}
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s $DIR/vimrc ~/.vimrc
vim +PluginInstall +qall
