#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# bashrc
cat $DIR/bashrc >> ~/.bashrc
source ~/.bashrc

# vim
mkdir ~/.vim/{_tmp,backup}
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s $DIR/vimrc ~/.vimrc
vim +PluginInstall +qall
