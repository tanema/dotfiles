.DEFAULT_GOAL := shorthelp
.PHONY: shorthelp help install/directories install/link install/xcode install/homebrew install/tools install/ohmyzsh install/ssh plugins
.PHONY: update/tools update/omz update/tools

install: | install/directories install/link install/xcode install/homebrew install/tools install/ohmyzsh install/ssh plugins ## Run full setup
update: | plugins update/omz update/tools ## Update tools and plugins

clean: ## Clean up the linked directories in the home directory.
	rm -rf ~/.config/git ~/.config/tmux ~/.vim ~/.zshrc

install/directories: ## Create directories that I expect to be there
	@echo "==== creating default directories"
	mkdir -p ~/workspace
	mkdir -p ~/.config

install/link: ## Link saved dotfiles to to home directory
	@echo "==== linking config files"
	ln -s ~/workspace/dotfiles/config/git ~/.config/git
	ln -s ~/workspace/dotfiles/config/tmux ~/.config/tmux
	ln -s ~/workspace/dotfiles/config/vim ~/.vim
	ln -sf ~/workspace/dotfiles/zshrc ~/.zshrc

install/xcode: ## ensure xcode doesnt get in our way
	@echo "==== ensuring xcode is setup"
	xcode-select --install

install/homebrew: ## install my package manager
	@echo "==== installing homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

install/tools: ## the default tools tools that I use
	brew install go tmux vim git gnupg ag rainbarf

install/omz: ## install oh my zsh sugar
	@echo "==== installing ohmyzsh"
	@sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	@git clone --depth 1 git://github.com/dracula/zsh.git ~/.oh-my-zsh/custom/themes/dracula

install/ssh: ## Generate and add a new ssh key to this system for my email
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

update/tools: ## Update the tools I use every day
	brew update
	brew upgrade go tmux vim git gnupg ag rainbarf

update/omz: ## Update zsh plugins
	@echo "==== updating ohmyzsh"
	omz update

install/plugins: plugins/vim plugins/tmux ## install all plugins
update/plugins: install/plugins ## update all plugins

plugins/vim: ## Install vim plugins
	@echo "==== installing vim plugins"
	@export REPO=dense-analysis/ale DEST=config/vim/pack/default/start/ale; $(MAKE) plugins/install;
	@export REPO=junegunn/fzf.vim DEST=config/vim/pack/default/start/fzf.vim; $(MAKE) plugins/install;  # fast file search with ctrl p
	@export REPO=junegunn/fzf DEST=config/vim/pack/default/start/fzf; $(MAKE) plugins/install;
	@export REPO=nanotech/jellybeans.vim DEST=config/vim/pack/default/start/jellybeans.vim; $(MAKE) plugins/install;
	@export REPO=ervandew/supertab DEST=config/vim/pack/default/start/supertab; $(MAKE) plugins/install; # tab compltion
	@export REPO=tpope/vim-surround DEST=config/vim/pack/default/start/vim-surround; $(MAKE) plugins/install; # easy wrap selected items
	@export REPO=tpope/vim-commentary DEST=config/vim/pack/default/start/vim-commentary; $(MAKE) plugins/install; # easy commenting
	@export REPO=tpope/vim-fugitive DEST=config/vim/pack/default/start/vim-fugitive; $(MAKE) plugins/install; # better netrw
	@export REPO=airblade/vim-gitgutter DEST=config/vim/pack/default/start/vim-gitgutter; $(MAKE) plugins/install; # marks the changes for git
	@export REPO=fatih/vim-go DEST=config/vim/pack/default/start/vim-go; $(MAKE) plugins/install; # go sytanx highlighting
	@export REPO=sheerun/vim-polyglot DEST=config/vim/pack/default/start/vim-polyglot; $(MAKE) plugins/install; # all syntaxes
	@export REPO=tpope/vim-vinegar DEST=config/vim/pack/default/start/vim-vinegar; $(MAKE) plugins/install; # better netrw

plugins/tmux: ## Install tmux plugins because I cant figure out tpm
	@echo "==== installing tmux plugins"
	@export REPO=tmux-plugins/tpm DEST=config/tmux/plugins/tpm; $(MAKE) plugins/install;
	@export REPO=tmux-plugins/tmux-yank DEST=config/tmux/plugins/tmux-yank; $(MAKE) plugins/install;
	@export REPO=tmux-plugins/tmux-sensible DEST=config/tmux/plugins/tmux-sensible; $(MAKE) plugins/install;

plugins/install: # a generic task that will clone a git plugin to a destination, requires a DEST and REPO env var
	@echo "installing ${REPO}" && \
		rm -rf ${DEST} && \
		git clone --quiet --depth=1 git@github.com:${REPO}.git ${DEST} && \
		rm -rf ${DEST}/.git && \
		echo "installed ${REPO} successfully"

shorthelp:
	@grep -E '^[a-zA-Z_0-9-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

help: ## Help output of all targets that are documented
	@grep -E '^[/a-zA-Z_0-9-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
