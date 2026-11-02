Tims Dotfiles
-------------

Run this command and hope to hell most of the work is done for you. This script 
sets up the computer's ssh key, clones the repo, and installs tools needed via 
homebrew.

```zsh
curl -fsSL https://timanema.com/dot | sh
```

## Config Strategy
I have tried hard to assert XDG setup in my environments so that my `$HOME` does 
not become cluttered with a mess of dotfiles. Config files are symlinked into place 
declaratively. 

## Git Local Config
I like to keep my gitconfig in the dotfiles, however I usually need a different
ssh key and email for each machine so I use an include directive in `git/config` 
and include the `~/.gitconfig.local` to change keys and emails.

## Colorschemes
I have a unified colorscheme setup so I have my colorscheme defined at 
`colorscheme/orlok.json` which is a copy of dracula. It is also exported to the 
shell at `$COLORSCHEME` so that everywhere the colorscheme is used, it uses the 
variable so that it can be swapped. Then, we use env var templates to generate 
other templates such as claude, nvim, and ghostty. 
