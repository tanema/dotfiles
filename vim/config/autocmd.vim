" set spelling on for git commits
au FileType gitcommit setlocal spell
" Restore cursor position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
" open a new window with that file
au BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" check if there are changes to the file
au BufEnter * silent! checktime
