" install vundle: git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
filetype off                      " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()               " lazy load plugins for faster startup
Plugin 'gmarik/vundle'            " package manager
Plugin 'surround.vim'             " easy wrap selected items
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'         " fast file search with ctrl p
Plugin 'tpope/vim-vinegar'        " better netrw
Plugin 'tpope/vim-fugitive'       " better netrw
Plugin 'tpope/vim-commentary.git' " easy commenting
Plugin 'airblade/vim-gitgutter'   " marks the changes for git
Plugin 'w0rp/ale.git'             " Syntax
Plugin 'ervandew/supertab'        " tab compltion
Plugin 'fatih/vim-go'             " go sytanx highlighting
Plugin 'sheerun/vim-polyglot'     " all syntaxes
Plugin 'nanotech/jellybeans.vim'
call vundle#end()                 " required
