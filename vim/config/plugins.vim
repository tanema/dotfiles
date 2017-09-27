" ------------------------------
"         Plugins
" install vundle     git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" ------------------------------
" bundle setup
filetype off                      " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()               " lazy load plugins for faster startup

Plugin 'gmarik/vundle'            " package manager
Plugin 'jellybeans.vim'           " color scheme
Plugin 'dracula/vim'
Plugin 'surround.vim'             " easy wrap selected items
Plugin 'kien/ctrlp.vim'           " fast file search with ctrl p
Plugin 'tpope/vim-vinegar'        " better netrw
Plugin 'tpope/vim-commentary.git' " easy commenting
Plugin 'fugitive.vim'             " git integration
Plugin 'ajh17/VimCompletesMe'     " Autocomplete

" Syntax Support
Plugin 'neomake/neomake'          " Syntax
Plugin 'benjie/neomake-local-eslint.vim' " local eslint usage
Plugin 'fatih/vim-go'             " go sytanx highlighting
Plugin 'PProvost/vim-ps1'         " Powershell syntax gross
Plugin 'glsl.vim'                 " glsl syntax highlighting
Plugin 'vim-coffee-script'        " coffee script syntax highlighting ugh
Plugin 'slim-template/vim-slim'   " slim syntax highlighting

call vundle#end()                 " required
