# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
ZSH_THEME="dracula"
COMPLETION_WAITING_DOTS="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR=vim
export GOPATH=~/workspace/go
export MINITEST_DIFF="git diff --color"

export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/Library/android-sdk/platform-tools
export PATH=$PATH:/Library/android-sdk/tools
export PATH=$PATH:/Library/flex_sdk/bin
export PATH=$PATH:/bin
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/usr/X11/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:$HOME/.rvm/bin
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:/opt/local/bin
export PATH=$PATH:$HOME/.yarn/bin
export PATH=$PATH:$HOME/.cargo/bin

alias tarhelp='echo "create:  tar -zcvf arc.tar.gx dir \nextract: tar -zxvf arc.tar.gz [-C outputdir] \n-z use gzip \n-v verbose \n-f filename \n-c create \n-x extract"'
alias reload='source ~/.zshrc'
alias make='make -j'
alias ctags="`brew --prefix`/bin/ctags"
alias rtags='ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)'

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
