Tims Dotfiles
-------------

Run this command and hope to hell most of the work is done for you. This script 
sets up the computer's ssh key, clones the repo, and installs tools needed via 
[mise](https://mise.jdx.dev).

```zsh
curl -fsSL https://raw.githubusercontent.com/tanema/dotfiles/main/install | bash
```

## Config Strategy
I have tried hard to assert XDG setup in my environments so that my `$HOME` does 
not become cluttered with a mess of dotfiles. See `zsh/zshrc` for my setup. Config 
files are symlinked into place declaratively via the `[dotfiles]` table in
`mise/config.toml`, applied as part of `mise bootstrap`.

## Git Local Config
I like to keep my gitconfig in the dotfiles, however I usually need a different key
and email for each machine so I use an include directive in `git/config`
and include the `~/.gitconfig.local` to change keys and emails.

## Plugin Strategy
Minimal plugin managers or LSP managers. Whenever a tool is needed for nvim, zsh 
or tmux:

- Add the tool to `mise/config.toml`: under `[tools]` for versioned dev tools/CLIs,
  or `[bootstrap.packages]` for system packages and homebrew casks.
- Run `./install` to install it.
- Add config to use it. (See lsp config as example: `nvim/lsp` files)
- For any plugins that are not able to be installed in this way, `git clone` them
  to their destination and commit to the dotfiles repo.
- Finally if you need a plugin for nvim, install it using the nvim package manager

With this setup, it prevents slow starting of any of my tools while plugin managers 
look up updates, or whatever they get up to. It has also eliminated a bunch of things
I don't use like the massive amount of functionality that `omz` has that I never used.

## Colorschemes
I have a unified colorscheme setup so I have my colorscheme defined at `colorscheme/orlok.json`
which is a copy of dracula. It is also exported to the shell at `$COLORSCHEME`
so that everywhere the colorscheme is used, it uses the variable so that it can
be swapped. Then, we use env var templates to generate other templates such 
as claude and ghostty. Lastly nvim loads and parses the json to define the colorscheme.
