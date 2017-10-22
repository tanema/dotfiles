#!/bin/bash
files=("gitconfig" "zshrc" "vim" "vim/vimrc" "tmux" "tmux/tmux.conf" "ctags")
for i in "${files[@]}"
do
  echo "$(pwd)/$i ~/.$(basename $i)"
done

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
