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
export PAT="glpat-hWWQxrzjSjd9eX_EL9Bz"

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
