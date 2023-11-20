.PHONY: all xcode homebrew tools alacritty ohmyzsh dev fetchdotfiles linkdotfiles vundle tmuxplugins ssh help

all: | directories xcode homebrew tools alacritty ohmyzsh dev fetchdotfiles linkdotfiles vundle tmuxplugins ssh ## Run full setup

update: vimplugins tmuxplugins omzupdate toolsupdate # update tools and plugins

directories: ## create directories that I expect to be there
	@echo "==== creating default directories"
	mkdir -p ~/workspace
	mkdir -p ~/.config

xcode: ## ensure xcode doesnt get in our way
	@echo "==== ensuring xcode is setup"
	xcode-select --install

homebrew: ## install my package manager
	@echo "==== installing homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

tools: ## the default tools tools that I use
	brew install go tmux vim git gnupg ag rainbarf

toolsupdate: ## Update the tools I use every day
	brew upgrade go tmux vim git gnupg ag rainbarf

ohmyzsh: ## install shopifys dev tool
	@echo "==== installing ohmyzsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone --depth 1 git://github.com/dracula/zsh.git ~/.oh-my-zsh/custom/themes/dracula

omzupdate: ## Update zsh plugins
	@echo "==== updating ohmyzsh"
	~/.oh-my-zsh/tools/upgrade.sh

fetchdotfiles: ## fetch the dotfiles repo into my workspace
	@echo "==== fetching dotfiles"
	git clone https://github.com/tanema/dotfiles.git ~/workspace/dotfiles

linkdotfiles: ## link saved dotfiles to to home directory
	@echo "==== linking config files"
	ln -sf ~/dotfiles/gitconfig ~/.gitconfig
	ln -sf ~/dotfiles/zshrc ~/.zshrc
	ln -sf ~/dotfiles/vim ~/.vim
	ln -sf ~/dotfiles/tmux ~/.tmux
	ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

vimplugins: ## Install vim plugins
	@echo "==== installing vim plugins"
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
	@echo "==== installing tmux plugins"
	@export REPO=tmux-plugins/tpm DEST=tmux/plugins/tpm; $(MAKE) plugin;
	@export REPO=tmux-plugins/tmux-yank DEST=tmux/plugins/tmux-yank; $(MAKE) plugin;
	@export REPO=tmux-plugins/tmux-sensible DEST=tmux/plugins/tmux-sensible; $(MAKE) plugin;

plugin: # a generic task that will clone a git plugin to a destination
	@echo "installing ${REPO}" && \
		rm -rf ${DEST} && \
		git clone --quiet --depth=1 git@github.com:${REPO}.git ${DEST} && \
		rm -rf ${DEST}/.git && \
		echo "installed ${REPO} successfully"

ssh: ## Generate and add a new ssh key to this system for my email
	@echo "==== generating a new ssh key"
	ssh-keygen -t rsa -b 4096 -C "timanema@gmail.com"
	eval "$(ssh-agent -s)"
	mkdir -p ~/.ssh
	~/.ssh/config << EndOfMessage
	Host *
		AddKeysToAgent yes
		IgnoreUnknown UseKeychain
		UseKeychain yes
		IdentityFile ~/.ssh/id_rsa
	EndOfMessage
	ssh-add -K ~/.ssh/id_rsa

help: ## This output
	@grep -E '^[a-zA-Z_0-9-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
