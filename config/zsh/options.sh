export DO_NOT_TRACK=1
export VISUAL=nvim
export EDITOR=nvim

HISTSIZE=50000
SAVEHIST=10000

autoload -U +X bashcompinit && bashcompinit
autoload -U compinit && compinit

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

setopt autocd                 # name a directory to navigate to it.
setopt NO_BEEP                # no dang bell
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data
unsetopt menu_complete        # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu              # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end
