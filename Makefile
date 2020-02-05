.PHONY: all xcode homebrew tools alacritty ohmyzsh dev fetchdotfiles linkdotfiles vundle tmuxplugins ssh help

all: | directories xcode homebrew tools alacritty ohmyzsh dev fetchdotfiles linkdotfiles vundle tmuxplugins ssh

directories: ## create directories that I expect to be there
	mkdir -p $HOME/workspace
	mkdir -p $HOME/.config
xcode: ## ensure xcode doesnt get in our way
	xcode-select --install
homebrew: ## install my package manager
	@echo "installing homebrew"
	@/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
tools: ## the default tools tools that I use
	brew install tmux vim git gnupg ag
alacritty: ## install my favourite terminal emulator
	brew cask install alacritty
ohmyzsh: ## install shopifys dev tool
	@echo "installing ohmyzsh"
	@sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
dev: ## install shopifys dev tool
	eval "$(curl -sS https://up.dev)"
fetchdotfiles: ## fetch the dotfiles repo into my workspace
	@echo "fetching dotfiles"
	git clone https://github.com/tanema/dotfiles.git $HOME/workspace/dotfiles
linkdotfiles: ## link saved dotfiles to to home directory
	@echo "Linking config files"
	ln -sf $HOME/workspace/dotfiles/gitconfig $HOME/.gitconfig
	ln -sf $HOME/workspace/dotfiles/zshrc $HOME/.zshrc
	ln -sf $HOME/workspace/dotfiles/vim $HOME/.vim
	ln -sf $HOME/workspace/dotfiles/tmux $HOME/.tmux
	ln -sf $HOME/workspace/dotfiles/tmux/tmux.conf $HOME/.tmux.conf
	ln -sf $HOME/workspace/dotfiles/alacritty $HOME/.config/.alacritty
vundle: ## install vundle and vim plugins
	@echo "installing vundle and vim plugins"
	@git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	@vim +BundleInstall +qall
tmuxplugins: ## Install tmux plugins because I cant figure out tpm
	@echo "Installing tmux plugins"
	git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
	git clone https://github.com/tmux-plugins/tmux-yank $HOME/.tmux/plugins/tmux-yank
	git clone https://github.com/tmux-plugins/tmux-sensible $HOME/.tmux/plugins/tmux-sensible
ssh: ## Generate and add a new ssh key to this system for my email
	@echo "Generating new ssh key"
	ssh-keygen -t rsa -b 4096 -C "timanema@gmail.com"
	eval "$(ssh-agent -s)"
	mkdir -p $HOME/.ssh
	$HOME/.ssh/config << EndOfMessage
	Host *
		AddKeysToAgent yes
		IgnoreUnknown UseKeychain
		UseKeychain yes
		IdentityFile ~/.ssh/id_rsa
	EndOfMessage
	ssh-add -K ~/.ssh/id_rsa
help:
	@grep -E '^[a-zA-Z_0-9-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
