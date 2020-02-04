#!/bin/bash
echo "xcode confirm"
xcode-select --install
echo "installing homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "installing tmux, vim and git gnupg"
brew install tmux vim git gnupg
echo "installing alacritty"
brew cask install alacritty
echo "installing ohmyzsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "installing vundle"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "installing dev"
eval "$(curl -sS https://up.dev)"
echo "fetching dotfiles"
mkdir $HOME/workspace
cd workspace
git clone https://github.com/tanema/dotfiles.git
cd dotfiles
echo "Linking config files"
files=("gitconfig" "zshrc" "vim" "tmux")
for i in "${files[@]}"; do
  echo "linking: $(pwd)/$i => $HOME/.$i"
  ln -sf $(pwd)/$i $HOME/.$i
done
echo "$(pwd)/tmux/tmux.conf $HOME/.tmux.conf"
ln -sf $(pwd)/tmux/tmux.conf $HOME/.tmux.conf
mkdir -p $HOME/.config
echo "linking: $(pwd)/alacritty => $HOME/.config/alacritty"
ln -sf $(pwd)/alacritty $HOME/.config/.alacritty

ssh-keygen -t rsa -b 4096 -C "timanema@gmail.com"
eval "$(ssh-agent -s)"
mkdir -p $HOME/.ssh
$HOME/.ssh/config << EndOfMessage
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa
EndOfMessage
ssh-add -K ~/.ssh/id_rsa

gpg --full-generate-key
