echo "Linking config files"
ln -sf $HOME/dotfiles/gitconfig $HOME/.gitconfig
ln -sf $HOME/dotfiles/zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/vim $HOME/.vim
ln -sf $HOME/dotfiles/tmux $HOME/.tmux
ln -sf $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
ln -sf $HOME/dotfiles/alacritty $HOME/.config/.alacritty

echo "installing vundle and vim plugins"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall

echo "Installing tmux plugins"
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tmux-yank $HOME/.tmux/plugins/tmux-yank
git clone https://github.com/tmux-plugins/tmux-sensible $HOME/.tmux/plugins/tmux-sensible
