# Shell Vars
# VISUAL: Programs check VISUAL first, fall back to EDITOR if unset or in a dumb terminal
# MANPAGER: overrides PAGER specifically for man pages, taking precedence over both PAGER and the man default
# LANG: controls encoding, sorting, date formats, and more across all programs
# WORDCHARS: defines which non-alphanumeric characters are considered part of a single word by the line editor
export DO_NOT_TRACK=1          # Opt out of telemetry for tools that respect this convention 
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export HISTSIZE=50000          # HISTSIZE = lines kept in memory per session 
export SAVEHIST=50000          # SAVEHIST = lines written to HISTFILE on disk 
export VISUAL=nvim             # VISUAL = full-screen editor (assumed capable terminal); 
export EDITOR=nvim             # EDITOR = fallback for line-oriented editors  
export GIT_EDITOR=nvim         # Commit message editor
export MANPAGER='nvim +Man!'   # Using nvims pager makes man pages a lot more friendly 
export PAGER="/usr/bin/less"   # PAGER is the default pager for anything that pages output (git log, systemctl, etc.) 
export LESS='-R -F -X'         # Less Args: -R=ANSI color, -F=Quit if small, -X=dont'clear when exit
export LESSHISTFILE="$XDG_DATA_HOME/less/history"
export LANG='en_CA.UTF-8'      # Set to canadian english 
export COLORTERM=truecolor     # Signals 24-bit truecolor support
export GPG_TTY=$(tty)          # Required for GPG to find the correct terminal for passphrase prompts and commit signing 
export BROWSER="/usr/bin/open" # Default browser for tools that open URLs (e.g. gh, some CLIs);  
export REPORTTIME=5            # Auto-print real/user/sys time for any command that takes longer than this many seconds 
export WORDCHARS=${WORDCHARS//[\/.-]} # Removing / means path segments are separate words 
# App Config folders
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
export RBENV_ROOT="$XDG_STATE_HOME/rbenv"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump-$HOST"
export ZSH="$XDG_CONFIG_HOME/zsh"
