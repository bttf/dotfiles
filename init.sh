#!/bin/bash
git submodule update --init
pushd ~
# not proud of the next 2 lines
ln -s ~/dotfiles/vimfiles .vim
ln -s ~/dotfiles/vimrc .vimrc
popd
