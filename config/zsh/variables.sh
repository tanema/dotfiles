# Builtin Shell Vars

# Opt out of telemetry for tools that respect this convention
export DO_NOT_TRACK=1

# History
# HISTSIZE = lines kept in memory per session
export HISTSIZE=50000
# SAVEHIST = lines written to HISTFILE on disk
export SAVEHIST=50000

# Programs check VISUAL first, fall back to EDITOR if unset or in a dumb terminal
# VISUAL = full-screen editor (assumed capable terminal);
export VISUAL=nvim
# EDITOR = fallback for line-oriented editors 
export EDITOR=nvim
export GIT_EDITOR=nvim

# MANPAGER overrides PAGER specifically for man pages, taking precedence over both PAGER and the man default
# Using nvims pager makes man pages a lot more friendly
export MANPAGER='nvim +Man!'

# PAGER is the default pager for anything that pages output (git log, systemctl, etc.)
export PAGER=less

# LESS options applied whenever less is invoked:
#   -R  render ANSI color escape codes rather than showing them raw
#   -F  quit immediately if output fits on one screen (no pager needed)
#   -X  don't clear the screen when less exits (keeps output visible)
export LESS='-R -F -X'

# Locale: controls encoding, sorting, date formats, and more across all programs
# Set to canadian english
export LANG='en_CA.UTF-8'

# Signals 24-bit truecolor support to apps that check this before enabling full color (e.g. nvim, tmux)
export COLORTERM=truecolor

# Required for GPG to find the correct terminal for passphrase prompts and commit signing
export GPG_TTY=$(tty)

# Default browser for tools that open URLs (e.g. gh, some CLIs); 
# Open will open urls in the default browser for us.
export BROWSER="/usr/bin/open"

# Controls which characters zsh treats as part of a word for deleting or moving
# Removing / means path segments are separate words
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Automatically print real/user/sys time for any command that takes longer than this many seconds
export REPORTTIME=5
