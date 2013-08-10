set nocompatible    " use vim defaults
filetype off				" required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"install vundle
"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'molokai'
Bundle 'vim-coffee-script'
Bundle 'surround.vim'
Bundle 'pbcopy.vim'
Bundle 'bling/vim-airline'
Bundle 'slim-template/vim-slim'

filetype plugin indent on     " required!

"set mouse=a		  		" use mouse because I am a noob
set ls=2            " allways show status line
set tabstop=2       " numbers of spaces of tab character
set shiftwidth=2    " numbers of spaces to (auto)indent
set expandtab				"spaces insteaf of tabs
set smarttab				" set tabspacing to be uniform
set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell
set noerrorbells    " stop beeping fucker
set nobackup        " do not keep a backup file
set nowb            " no write backup
set noswapfile      " no swap files either they are a pain in the ass
set number          " show line numbers
set ignorecase      " ignore case when searching 
set title           " show title in console title bar
set ttyfast         " smoother changes
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
set noautoindent
set nosmartindent
set nocindent
set splitright      " when vertical splitting set new window to the right
set splitbelow      " when splitting the new window opens below
set showmatch       " highlight matches
set nowrap          " text wrap off eff that sheet
set virtualedit=all " this means we can go into empty spaces
set hidden          " this is so we can hide windows without complaints
" set wildmode=longest,list,full " enables longer tab completion
set wildmenu        " enables tab completion on stuff like tabe
set switchbuf+=usetab,newtab " this will make it switch to a tab if I already have the file open and open the quickfix in a tab
set pastetoggle=<F3>

syntax on           " syntax highlighing
colorscheme molokai    " use this color scheme

" Set Netrw defaults
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
 
    " Ctrl+X O
    autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd Filetype html,xml,xsl source ~/.vim/closetag.vim
    autocmd BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru} set ft=ruby
    autocmd BufRead,BufNewFile *.scss set ft=css
    autocmd BufRead,BufNewFile *.json set ft=json syntax=javascript
    autocmd BufNewFile,BufRead *.coffee set filetype=coffee
    autocmd BufRead,BufNewFile *.go set filetype=go
    
    " This make it so I can go to the place I want to go to in quickfix
    autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
endif

" function definitions
function FindAll(where, to_find)
  execute ":vimgrep " . a:to_find . " " . a:where . " | copen"
endfunction
 
" Keyboard mappings"

" switch tab shortcuts
map <C-m> gt
map <C-n> gT
" These are to cancel the default behavior of d, D, c, C
" to put the text they delete in the default register.
" Note that this means e.g. "ad won't copy the text into
" register a anymore.  You have to explicitly yank it.
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
vnoremap p "_dP
" tab and window quick edit shortcuts
nnoremap te :tabe **/
nnoremap tn :tabnew<CR>
nnoremap tv :vsp **/
nnoremap th :split **/
" window movement shortcuts
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" find all occurences shortcut
nnoremap fa :Fa **/* 
command! -nargs=* Fa call FindAll(<f-args>)


" bett copy and paste
imap <C-v>  <C-O>:set paste<CR><C-r>*<C-O>:set nopaste<CR>


" remove separators
let g:airline_left_sep=''
let g:airline_right_sep=''
" remove unused modes
let g:airline_enable_fugitive=0
let g:airline_enable_syntastic=0
" set second section to filename
let g:airline_section_b="%f"
" empty third and fourth sections
let g:airline_section_c=""
let g:airline_section_x=""
" put filetype in fifth section
let g:airline_section_y="%Y"
