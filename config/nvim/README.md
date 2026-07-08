NEOVIM Config Files
###################
  
## Directory Layout
This is the layout of the config structure that neovim expects on loading or at 
least the files and folders I might need some day.

config/nvim
    |-- start/    # Packages, loaded after plugins
    |-- autoload/ # Automatically loaded scripts autoload-functions `:call filename#funcname()`
    |-- after/    # Files are loaded after the others, used for changes to current setup.
    |-- compiler/ # Change arguments to a languages compiler. see `:help :compiler`
    |-- ftplugin/ # Files that are required for specific file types used for tailoring settings. see `write-filetype-plugin`
    |-- colors/	  # color scheme files see :colorscheme
    |-- lua/      # Modules that can be required by other lua files in plugin/syntax/after/init
    |-- lsp/	  # LSP client configurations see lsp-config
    |-- pack/	  # Custom packages :packadd
    |-- parser/	  # treesitter syntax parsers
    |-- plugin/   # Lua Files that are automatically required on startup.
    |-- queries/  # treesitter queries
    |-- rplugin/  # Write plugin in different language like ruby. see `remote-plugin`
    |-- spell/	  # Spell checking dictionaries.
    |-- syntax/   # Custom syntax settings loaded when the filetype is loaded.
    |-- init.lua  # Root starting point of configurations.


## Load Order As Needed by me
- Load `init.vim`
- Load `plugin/**/*.{vim,lua}` 
    - directories with a `after` suffix will be loaded with the after directory.
- Load `start/**/*.{vim,lua}`

## Useful
- Load without plugins or syntax highlighting `nvim -u NONE`
- Load specific settings file `nvim -u {file}`
- Don't load plugins `nvim --noplugin`
- Load first install `nvim --clean`
- Track startup time `nvim --startuptime`
