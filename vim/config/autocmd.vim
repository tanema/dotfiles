" set spelling on for git commits
au FileType gitcommit setlocal spell
" Restore cursor position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
" open a new window with that file
au BufReadPost quickfix nnoremap <buffer> <CR> <CR>
au BufWritePre * %s/\s\+$//e | :retab " Remove all trailing whitespace and reformat tabs to spaces on save
au BufWritePost * :GitGutter    " Check git status on save
au BufEnter * silent! checktime " check if there are changes to the file

au BufRead,BufNewFile *.sqrt set filetype=squirt
