# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="dracula/dracula"
COMPLETION_WAITING_DOTS="true"
plugins=(git)
[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh

export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR=vim
export GOPATH=~/workspace/go
export MINITEST_DIFF="git diff --color"

export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/bin
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/usr/X11/bin
export PATH=$PATH:$HOME/.cargo/bin

alias reload='source ~/.zshrc'
alias make='make -j'

# Tool sourcing
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
if [ -e /Users/timanema/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/timanema/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
