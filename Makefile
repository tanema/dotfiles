.DEFAULT_GOAL := shorthelp

install: ## Clean install of all the tools that we need
	@$(MAKE) clean
	@$(MAKE) install/config
	@$(MAKE) install/tools
	@$(MAKE) install/gpg
	@$(MAKE) install/plugins

update: | plugins update/tools ## Update tools and plugins

clean: ## Clean up the linked directories in the home directory.
	@rm -rf \
		~/.config/git \
		~/.config/tmux \
		~/.config/nvim \
		~/.config/homebrew \
		~/.ssh/config \
		~/.zshrc

install/config: ## Link saved dotfiles to to home directory
	@echo "=== creating default directories ==="
	@mkdir -p ~/.config ~/.config/less ~/.config/zsh
	@echo "=== linking config files ==="
	@ln -sf ~/workspace/dotfiles/config/git        ~/.config/git
	@ln -sf ~/workspace/dotfiles/config/tmux       ~/.config/tmux
	@ln -sf ~/workspace/dotfiles/config/nvim       ~/.config/nvim
	@ln -sf ~/workspace/dotfiles/config/homebrew   ~/.config/homebrew
	@ln -sf ~/workspace/dotfiles/config/ssh/config ~/.ssh/config
	@ln -sf ~/workspace/dotfiles/config/zshrc      ~/.zshrc

install/gpg: ## Generate a new gpg key
	@echo "=== setting up GPG ==="
	@gpg --default-new-key-algo rsa4096 --gen-key
	@gpg --armor --export $(gpg --list-keys --with-colons --with-fingerprint | awk -F: '/^fpr:/ { print $10 }' | tail -n 1) | pbcopy
	@open "https://github.com/settings/keys"
	@read -p "New gpg key is in clipboard add it to github and press enter to continue ..."

install/tools: install/xcode install/homebrew install/omz ## the default tools that I use

install/xcode: ## ensure xcode doesnt get in our way
	@echo "=== ensuring xcode is setup ==="
	@xcode-select --install || echo "already installed"

install/homebrew: ## install my package manager
	@echo "=== installing homebrew ===""
	@echo "=== energizing sudo ===""
	@sudo true
	NONINTERACTIVE=1 curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
	@echo "=== installing brew bundle ==="
	/opt/homebrew/bin/brew shellenv | eval
	/opt/homebrew/bin/brew bundle --global

install/omz: ## install oh my zsh sugar
	@echo "=== installing ohmyzsh ==="
	@curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh

update/tools: ## Update the tools I use every day
	@echo "=== updating brew ==="
	@brew bundle --global
	@echo "=== updating ohmyzsh ==="
	@omz update

install/plugins: plugins/tmux plugins/omz ## install all plugins
update/plugins: install/plugins ## update all plugins

plugins/tmux: ## Install tmux plugins because I cant figure out tpm
	@echo "==== installing tmux plugins"
	@export REPO=tmux-plugins/tpm DEST=config/tmux/plugins/tpm; $(MAKE) plugins/install;
	@export REPO=tmux-plugins/tmux-yank DEST=config/tmux/plugins/tmux-yank; $(MAKE) plugins/install;
	@export REPO=tmux-plugins/tmux-sensible DEST=config/tmux/plugins/tmux-sensible; $(MAKE) plugins/install;

plugins/omz: ## Install themes for omz
	@export REPO=dracula/zsh DEST=~/.oh-my-zsh/custom/themes/dracula; $(MAKE) plugins/install

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
