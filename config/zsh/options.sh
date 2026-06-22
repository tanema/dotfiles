export HISTSIZE=50000
export SAVEHIST=10000

autoload -U compinit; compinit
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

setopt autocd                 # name a directory to navigate to it.
setopt NO_BEEP                # no dang bell
setopt EXTENDED_HISTORY       # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_ALL_DUPS   # History won't save duplicates.
setopt HIST_IGNORE_DUPS       # Don\'t record an entry that was just recorded again.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt HIST_IGNORE_SPACE      # Don\'t record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS      # Don\'t write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY            # show command with history expansion to user before running it
setopt INC_APPEND_HISTORY     # automatically append history after every command rather than on exit
setopt AUTO_MENU              # show completion menu on successive tab press
setopt COMPLETE_IN_WORD       # Allow completion from within a word/phrase
setopt ALWAYS_TO_END          # When completing from the middle of a word, move the cursor to the end of the word
setopt PROMPT_SUBST           # Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
