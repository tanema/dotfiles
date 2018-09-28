#!/bin/bash
files=("gitconfig" "zshrc" "vim" "tmux")
for i in "${files[@]}"; do
  echo "linking: $(pwd)/$i => ~/.$(basename $i)"
  ln -sf "$(pwd)/$i ~/.$(basename $i)"
done

config=("alacritty")
for i in "${config[@]}"; do
  echo "linking: $(pwd)/$i => ~/.config/$(basename $i)"
  ln -sf "$(pwd)/$i ~/.$(basename $i)"
done
