" ------------------------------
"           Netrw
" ------------------------------
let g:netrw_banner=0                                          " no banner
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'      " order setting
let g:netrw_localrmdir='rm -r'                                " Allow netrw to remove non-empty local directories

" Add hide files to wildignore. This works with vim-vinegar
set wildignore+=.DS_Store
set wildignore+=.git
