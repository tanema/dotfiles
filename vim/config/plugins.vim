" bundle setup
filetype off                    " required!
set rtp+=~/.vim/bundle/vundle/
" ------------------------------
"         Plugins
" install vundle     git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" ------------------------------
call vundle#begin()               " lazy load plugins for faster startup
Plugin 'gmarik/vundle'            " package manager
Plugin 'jellybeans.vim'           " color scheme
Plugin 'surround.vim'             " easy wrap selected items
Plugin 'bling/vim-airline'        " nice status line
Plugin 'scrooloose/nerdcommenter' " easy comment blocks
Plugin 'kien/ctrlp.vim'           " fast file search with ctrl p
Plugin 'fatih/vim-go'             " go sytanx highlighting
Plugin 'glsl.vim'                 " glsl syntax highlighting
Plugin 'vim-coffee-script'        " coffee script syntax highlighting
Plugin 'slim-template/vim-slim'   " slim syntax highlighting
Plugin 'tpope/vim-vinegar'        " better netrw
Plugin 'fugitive.vim'             " git integration
Plugin 'neomake/neomake'          " Syntax
Plugin 'benjie/neomake-local-eslint.vim' " local eslint usage
Plugin 'PProvost/vim-ps1'         " Powershell syntax
call vundle#end()                 " required
