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
vimplugins:
	@export REPO=dense-analysis/ale DEST=vim/pack/default/start/ale; $(MAKE) plugin;
	@export REPO=junegunn/fzf.vim DEST=vim/pack/default/start/fzf.vim; $(MAKE) plugin;  # fast file search with ctrl p
	@export REPO=junegunn/fzf DEST=vim/pack/default/start/fzf; $(MAKE) plugin;
	@export REPO=nanotech/jellybeans.vim DEST=vim/pack/default/start/jellybeans.vim; $(MAKE) plugin;
	@export REPO=ervandew/supertab DEST=vim/pack/default/start/supertab; $(MAKE) plugin; # tab compltion
	@export REPO=tpope/vim-surround DEST=vim/pack/default/start/vim-surround; $(MAKE) plugin; # easy wrap selected items
	@export REPO=tpope/vim-commentary DEST=vim/pack/default/start/vim-commentary; $(MAKE) plugin; # easy commenting
	@export REPO=tpope/vim-fugitive DEST=vim/pack/default/start/vim-fugitive; $(MAKE) plugin; # better netrw
	@export REPO=airblade/vim-gitgutter DEST=vim/pack/default/start/vim-gitgutter; $(MAKE) plugin; # marks the changes for git
	@export REPO=fatih/vim-go DEST=vim/pack/default/start/vim-go; $(MAKE) plugin; # go sytanx highlighting
	@export REPO=sheerun/vim-polyglot DEST=vim/pack/default/start/vim-polyglot; $(MAKE) plugin; # all syntaxes
	@export REPO=tpope/vim-vinegar DEST=vim/pack/default/start/vim-vinegar; $(MAKE) plugin; # better netrw
tmuxplugins: ## Install tmux plugins because I cant figure out tpm
	@export REPO=tmux-plugins/tpm DEST=tmux/plugins/tpm; $(MAKE) plugin;
	@export REPO=tmux-plugins/tmux-yank DEST=tmux/plugins/tmux-yank; $(MAKE) plugin;
	@export REPO=tmux-plugins/tmux-sensible DEST=tmux/plugins/tmux-sensible; $(MAKE) plugin;
plugin:
	@echo "installing ${REPO}" && \
		rm -rf ${DEST} && \
		git clone --quiet --depth=1 --branch=master git@github.com:${REPO}.git ${DEST} && \
		rm -rf ${DEST}/.git && \
		echo "installed ${REPO} successfully"
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
