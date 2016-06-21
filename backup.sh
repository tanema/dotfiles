#!/bin/bash
function cp_dir() {
  rm -R ~/workspace/dotfiles/$1
  cp -r ~/.$1 ~/workspace/dotfiles/
  mv ~/workspace/dotfiles/.$1 ~/workspace/dotfiles/$1
}

cp ~/.zshrc ~/workspace/dotfiles/zshrc
cp ~/.gitconfig ~/workspace/dotfiles/gitconfig
cp_dir vim
cp_dir tmux
cp_dir irssi
cd ~/workspace/dotfiles/
