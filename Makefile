.DEFAULT_GOAL := shorthelp

install: ## Clean install of all the tools that we need
	@$(MAKE) clean
	@$(MAKE) install/config
	@$(MAKE) install/tools
	@$(MAKE) install/gpg

update: ## Update tools
	@brew bundle --global

clean: ## Clean up the linked directories in the home directory.
	@rm -rf \
		~/.config/git \
		~/.config/tmux \
		~/.config/nvim \
		~/.config/homebrew \
		~/.config/zsh \
		~/.config/claude \
		~/.ssh/config \
		~/.zshrc

install/config: ## Link saved dotfiles to to home directory
	@echo "=== creating default directories ==="
	@mkdir -p ~/.config ~/.config/irb ~/.local/share/less ~/.local/share/zsh
	@touch ~/.gitconfig.local
	@echo "=== linking config files ==="
	@ln -sf ~/workspace/dotfiles/config/git        ~/.config/git
	@ln -sf ~/workspace/dotfiles/config/tmux       ~/.config/tmux
	@ln -sf ~/workspace/dotfiles/config/nvim       ~/.config/nvim
	@ln -sf ~/workspace/dotfiles/config/homebrew   ~/.config/homebrew
	@ln -sf ~/workspace/dotfiles/config/claude     ~/.config/claude
	@ln -sf ~/workspace/dotfiles/config/zsh        ~/.config/zsh
	@ln -sf ~/workspace/dotfiles/config/ssh/config ~/.ssh/config
	@ln -sf ~/workspace/dotfiles/config/zsh/zshrc  ~/.zshrc

install/tools: ## the default tools that I use
	@echo "=== ensuring xcode is setup ==="
	@xcode-select --install || echo "already installed"
	@echo "=== energizing sudo ==="
	@sudo true
	@echo "=== installing homebrew ==="
	NONINTERACTIVE=1 curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
	@echo "=== installing brew bundle ==="
	/opt/homebrew/bin/brew shellenv | eval
	/opt/homebrew/bin/brew bundle --global

install/gpg: ## Generate a new gpg key
	@echo "=== setting up GPG ==="
	@gpg --default-new-key-algo rsa4096 --gen-key
	@gpg --armor --export $(gpg --list-keys --with-colons --with-fingerprint | awk -F: '/^fpr:/ { print $10 }' | tail -n 1) | pbcopy
	@open "https://github.com/settings/keys"
	@read -p "New gpg key is in clipboard add it to github and press enter to continue ..."

shorthelp:
	@grep -E '^[a-zA-Z_0-9-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

help: ## Help output of all targets that are documented
	@grep -E '^[/a-zA-Z_0-9-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
