#!/usr/bin/env bash
# this file is basically only used for spin
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -sf ~/dotfiles/vim ~/.vim
ln -sf ~/dotfiles/tmux ~/.tmux
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

mkdir ~/.ssh
echo "Host github.com
  StrictHostKeyChecking no" >> ~/.ssh/config
git config commit.gpgsign false

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth 1 https://github.com/dracula/zsh.git ~/.oh-my-zsh/custom/theme/dracula
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
sudo apt-get install -y silversearcher-ag
