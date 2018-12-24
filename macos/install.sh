#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
linkTo() {
  if [ ! -h $2 ]; then
    ln -sn $1 $2
  fi
  return
}

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle

# copy iterm config
# Specify the preferences directory
mkdir -p $HOME/.config/iterm2
cp $DIR/*.iterm2.plist $HOME/.config/iterm2
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/.config/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# nvm
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/creationix/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
)

# nvim
mkdir -p $HOME/.local/share
mkdir -p $HOME/.config/nvim
linkTo $DIR/nvim $HOME/.local/share/nvim
linkTo $DIR/nvim/init.vim $HOME/.config/nvim/init.vim

# install plug
if [ ! -f $DIR/nvim/site/autoload/plug.vim ]; then
  curl -fLo $DIR/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
# install plugins
nvim +PlugInstall +qall

# configure git to use nvim
git config --global core.editor "nvim"

# tmux
linkTo $DIR/tmux/tmux.conf $HOME/.tmux.conf
