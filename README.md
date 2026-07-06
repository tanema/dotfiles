# Tims Dotfiles

Run this command and hope to hell most of the work is done for you. This script sets up the 
computer's ssh key, clones the repo, and calls the install script.

```zsh
curl -fsSL https://raw.githubusercontent.com/tanema/dotfiles/main/scripts/start | bash
```
## Updates
If any updates are needed a script call `dotupdate` is linked in `~/.local/bin` so 
at anytime you can call `dotupdate` to update those deps.

## First Setup and Maintenance Strategy
A fresh setup almost never goes exactly as expected because deps change, environments change,
and so on. So breaking up the setup in the makefile into many steps that can be called
individually, allows me to be able to pick up the pieces after something inevitably fails.

## Config Strategy
I have tried hard to assert XDG setup in my environments so that my $HOME does not
become cluttered with a mess of dotfiles. See `config/zsh/xdg_setup.sh` for my setup.

## Git Config
I like to keep my gitconfig in the dotfiles, however I usually need a different key
and email for each machine so I use an include directive in `config/git/config`
and include the `~/.gitconfig.local` to change keys and emails.

## Plugin Strategy
No plugin managers or LSP managers. Whenever a tool is needed for nvim, zsh or tmux:

- Add tool to config/homebrew/Brewfile or add an install command to the `./scripts/dotupdate` script.
- Run `dotupdate` to install it.
- Add config to use it.
    - In `zsh` source the tool
    - In `nvim` add config. (See: `config/nvim/lsp` files)
- For any plugins that are not able to be installed in this way, `git clone` them
  to their destination and commit to the dotfiles repo.
    - See `config/zsh/themes/dracula` and it is sourced in the zshrc.

With this setup, we prevent slow starting of any of my tools while plugin managers 
look up updates, or whatever they get up to. It has also eliminated a bunch of things
I don't use like the massive amount of functionality that `omz` has that I never used.
