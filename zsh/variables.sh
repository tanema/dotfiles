# App Config folders
export DOTFILES="$HOME/workspace/dotfiles"
export COLORSCHEME="$DOTFILES/colorscheme/orlok.json"
export AWS_CLI_HISTORY_FILE="$XDG_DATA_HOME/aws/history"
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_DATA_HOME/aws/credentials"
export BUNDLE_USER_HOME="$XDG_CONFIG_HOME/bundle"
export CLAUDE_CONFIG_DIR="$XDG_CONFIG_HOME/claude"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export KUBECONFIG="$XDG_CONFIG_HOME/kube/config"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/config"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump-$HOST"

# Setting the $PATH variable to ensure a clean and properly ordered $PATH in every 
# environment without having to touch /etc/paths which requires sudo. It also 
# ensures that if anything has touched my /etc/paths it will no get touched anyways.
export PATH=""                                         # reset so my path to empty.
export PATH=$PATH:/opt/homebrew/bin:/opt/homebrew/sbin # use homebrew over any system command
export PATH=$PATH:$HOME/.local/bin                     # custom local system commands if I make them.
export PATH=$PATH:$GOPATH/bin                          # golang tools
export PATH=$PATH:$HOME/.cargo/bin                     # rust tools
export PATH=$PATH:/usr/local/bin:/usr/local/sbin       # local takes precedence over /usr
export PATH=$PATH:/usr/bin:/usr/sbin                   # usr takes precedence over /
export PATH=$PATH:/bin:/sbin                           # root tools
