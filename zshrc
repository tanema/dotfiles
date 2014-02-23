# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export GOROOT=/usr/local/go
export GOPATH=~/workspace/goworkspace
export PATH=$GOPATH/bin:/usr/local/bin:/usr/bin:/Library/flex_sdk/bin:/Library/android-sdk/tools:/Library/android-sdk/platform-tools:/Users/tanema/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/git/bin:/usr/local/share/npm/bin:/usr/local/sbin:$GOROOT/bin

#stop autocorrect
#unsetopt correct_all
alias tarhelp='echo "create:  tar -zcvf arc.tar.gx dir \nextract: tar -zxvf arc.tar.gz [-C outputdir] \n-z use gzip \n-v verbose \n-f filename \n-c create \n-x extract"'
alias c='cd'
alias r='rails'
alias v='vim'
alias vv='vim .'
alias gp='git push'
alias gc='git commit'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
