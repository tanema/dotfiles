# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export JRUBY_OPTS="--headless -J-XX:MaxPermSize=128m"
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
export PATH=$PATH:/usr/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/usr/X11/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:$HOME/.rvm/bin
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:.mutt/bin
export PATH=$PATH:/opt/local/bin

alias tarhelp='echo "create:  tar -zcvf arc.tar.gx dir \nextract: tar -zxvf arc.tar.gz [-C outputdir] \n-z use gzip \n-v verbose \n-f filename \n-c create \n-x extract"'
alias r='rails'
alias rs='rails s'
alias rc='rails c'
alias v='vim'
alias vv='vim .'
alias gp='git push'
alias gc='git commit'
alias vimconfig="vim ~/.vimrc"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias backupconfig="cp ~/.vimrc ~/workspace/dotfiles/vimrc && cp ~/.zshrc ~/workspace/dotfiles/zshrc && cd ~/workspace/dotfiles/"
alias love='/Applications/love.app/Contents/MacOS/love'
alias make='make -j'
[[ -s "/Users/tanema/.gvm/scripts/gvm" ]] && source "/Users/tanema/.gvm/scripts/gvm"
