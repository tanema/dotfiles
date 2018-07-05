filetype plugin indent on       " required!
set mouse=r                     " no mouse for you
set ls=2                        " allways show status line
set tabstop=2                   " numbers of spaces of tab character
set shiftwidth=2                " numbers of spaces to (auto)indent
set expandtab                   " spaces insteaf of tabs
set smarttab                    " set tabspacing to be uniform
set scrolloff=10                " keep 3 lines when scrolling
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
set whichwrap=b,s,h,l,<,>,[,]   " move freely between lines
set foldmethod=indent           " Folding based on just indentation
set foldlevel=20                " set fold level at a high level so most files are not all folded when opening
set noautoindent                " Turn off indentation settings, let syntax handle this stuff
set nosmartindent               " Turn off indentation settings, let syntax handle this stuff
set nocindent                   " Turn off indentation settings, let syntax handle this stuff
set splitright                  " when vertical splitting set new window to the right
set splitbelow                  " when splitting the new window opens below
set showmatch                   " highlight matches
set cursorline                  " highlight current cursorline
set nowrap                      " text wrap off eff that sheet
set virtualedit=all             " this means we can go into empty spaces
set hidden                      " this is so we can hide windows without complaints
set wildmenu                    " enables tab completion on stuff like tabe
set switchbuf+=usetab,newtab    " this will make it switch to a tab if I already
                                " have the file open and open the quickfix in a tab
set clipboard+=unnamed          " use system clipboard
set t_Co=256                    " use 256 colors
let &colorcolumn="80,".join(range(120,200),",") "setup column warning and no-go zone
set synmaxcol=200               " speed up vim by disabling syntax on long lines
set completeopt-=preview        " stop preview window from opening with omnicomplete
set pastetoggle=<F2>            " change behaviour of pasting with f2
set autoread                    " auto reload files
set shell=$SHELL                " set shell for shell command explicitly
set nojoinspaces                " Insert only one space when joining lines that
                                " contain sentence-terminating punctuation like
set t_ti= t_te=                 " Don't clear the screen when running a command or exiting
                                " See http://www.shallowsky.com/linux/noaltscreen.html
set listchars=tab:→\ ,nbsp:~    " set how hidden characters are displayed
set list                        " display hidden characters

syntax on                       " syntax highlighing is on
colorscheme jellybeans          " Pretty Colors
