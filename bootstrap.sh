#!/bin/bash
# quickly link all my dot files to thier proper locations
ln -sf $(pwd)/gitconfig ~/.gitconfig
ln -sf $(pwd)/zshrc ~/.zshrc
ln -sf $(pwd)/vim ~/.vim
ln -sf $(pwd)/vim/vimrc ~/.vimrc
mkdir ~/.config/nvim
ln -sf $(pwd)/vim/vimrc ~/.config/nvim/init.vim
ln -sf $(pwd)/tmux ~/.tmux
ln -sf $(pwd)/tmux/tmux.conf ~/.tmux.conf
ln -sf $(pwd)/ctags ~/.ctags
