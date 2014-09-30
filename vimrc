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
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'jellybeans.vim'
Bundle 'surround.vim'
Bundle 'bling/vim-airline'
"syntax
Bundle 'vim-coffee-script'
Bundle 'slim-template/vim-slim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'

filetype plugin indent on     " required!

set foldmethod=indent
set foldlevel=20
set ls=2                        " allways show status line
set tabstop=2                   " numbers of spaces of tab character
set shiftwidth=2                " numbers of spaces to (auto)indent
set expandtab				            " spaces insteaf of tabs
set smarttab				            " set tabspacing to be uniform
set scrolloff=3                 " keep 3 lines when scrolling
set showcmd                     " display incomplete commands
set backspace=2                 " make backspace work like most other apps
set backspace=indent,eol,start  " make backspace work like most other apps 
set hlsearch                    " highlight searches
set incsearch                   " do incremental searching
set ruler                       " show the cursor position all the time
set visualbell t_vb=            " turn off error beep/flash
set novisualbell                " turn off visual bell
set noerrorbells                " stop beeping fucker
set nobackup                    " do not keep a backup file
set nowb                        " no write backup
set noswapfile                  " no swap files either they are a pain in the ass
set number                      " show line numbers
set ignorecase                  " ignore case when searching 
set title                       " show title in console title bar
set ttyfast                     " smoother changes
set modeline                    " last lines in document sets vim mode
set modelines=3                 " number lines checked for modelines
set shortmess=atI               " Abbreviate messages
set nostartofline               " don't jump to first character when paging
set whichwrap=b,s,h,l,<,>,[,]   " move freely between files
set noautoindent
set nosmartindent
set nocindent
set splitright                  " when vertical splitting set new window to the right
set splitbelow                  " when splitting the new window opens below
set showmatch                   " highlight matches
set nowrap                      " text wrap off eff that sheet
set virtualedit=all             " this means we can go into empty spaces
set hidden                      " this is so we can hide windows without complaints
set wildmenu                    " enables tab completion on stuff like tabe
set switchbuf+=usetab,newtab    " this will make it switch to a tab if I already have the file open and open the quickfix in a tab
set clipboard+=unnamed          " use system clipboard
set t_Co=256                    " use 256 colors
let &colorcolumn="80,".join(range(120,999),",") "setup column warning and no-go zone

syntax on           " syntax highlighing
colorscheme jellybeans

" Set Netrw defaults
let g:netrw_banner=0 " no banner
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro' "order setting
let g:netrw_list_hide= '.*\.swp$,\.DS_Store,^\.\/$' "hide these files from listing

if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
 
    autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
    autocmd FileType go,golang  set omnifunc=gocomplete#Complete

    autocmd BufRead,BufNewFile {*.jbuilder,*.csvbuilder,Gemfile}  set filetype=ruby
    autocmd BufRead,BufNewFile *.scss                             set filetype=css
    autocmd BufRead,BufNewFile {*.json,*.tss}                     set filetype=json syntax=javascript
    autocmd BufRead,BufNewFile *.coffee                           set filetype=coffee
    autocmd BufRead,BufNewFile *.go                               set filetype=go
    autocmd BufRead,BufNewFile *.slim                             set filetype=slim
    
    " This will enable pressing <CR> on a file in the quickfix and it will
    " open a new window with that file
    autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
endif

" function definitions
function FindAll(where, to_find)
  execute ":vimgrep " . a:to_find . " " . a:where . " | copen"
endfunction
 
" Keyboard mappings"
" folding space key in normal
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" turn off the damn arrow keys
noremap  <Up>     <NOP>
noremap  <Down>   <NOP>
noremap  <Left>   <NOP>
noremap  <Right>  <NOP>
inoremap <Up>     <NOP>
inoremap <Down>   <NOP>
inoremap <Left>   <NOP>
inoremap <Right>  <NOP>
vnoremap <Up>     <NOP>
vnoremap <Down>   <NOP>
vnoremap <Left>   <NOP>
vnoremap <Right>  <NOP>

" disable Ex mode key and map it to last macro
nnoremap Q @@
xnoremap Q @@
"save my wrist with semicolon swap with colon
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ; 
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
nnoremap to :e **/
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
" this will make the ruby plugin less of a pain in the ass
let g:ruby_path = system('rvm current')

"this needs to be at the bottom otherwise it wont work
hi ColorColumn ctermbg=235 guibg=#2c2d27
