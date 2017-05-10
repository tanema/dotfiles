# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR=vim
export GOPATH=~/workspace/go
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

alias tarhelp='echo "create:  tar -zcvf arc.tar.gx dir \nextract: tar -zxvf arc.tar.gz [-C outputdir] \n-z use gzip \n-v verbose \n-f filename \n-c create \n-x extract"'
alias reload='source ~/.zshrc'
alias r='rails'
alias rs='rails s'
alias rc='rails c'
alias v='vim'
alias vv='vim .'
alias gp='git push'
alias gc='git commit -am'
alias gg='git grep'
alias tmuxcfg="vim ~/.tmux"
alias vimcfg="vim ~/.vim"
alias zshcfg="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias bkpcfg="~/workspace/dotfiles/backup.sh && cd ~/workspace/dotfiles/"
alias make='make -j'
alias dus='dev down && dev up && dev server'
alias us='dev up && dev server'
alias hi='pbpaste | highlight --syntax=js -O rtf | pbcopy'
alias ctags="`brew --prefix`/bin/ctags"
alias rtags='ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)'

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

export MEMCACHEDCLOUD_PASSWORD=tOBX92GBeyflkBCY
export MEMCACHEDCLOUD_SERVERS=pub-memcache-14313.us-east-1-3.6.ec2.redislabs.com:14313
export MEMCACHEDCLOUD_USERNAME=memcached-app682181

export PATH="$HOME/.yarn/bin:$PATH"
