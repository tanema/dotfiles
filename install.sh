#!/usr/bin/env bash
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/vim ~/.vim
ln -sf ~/dotfiles/tmux ~/.tmux
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

if ! command -v fzf &> /dev/null; then
  sudo apt-get install -y fzf
fi
if ! command -v ag &> /dev/null; then
  sudo apt-get install -y silversearcher-ag
fi
