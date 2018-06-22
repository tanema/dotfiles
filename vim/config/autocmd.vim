" ------------------------------
"        Auto Command
" ------------------------------
" Restore cursor position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
" specify filetypes where they are not normally picked up
au BufRead,BufNewFile {*.jbuilder,*.csvbuilder,Gemfile}  set filetype=ruby
au BufRead,BufNewFile *.scss                             set filetype=css
au BufRead,BufNewFile {*.json,*.tss}                     set filetype=json syntax=javascript
au BufRead,BufNewFile *.coffee                           set filetype=coffee
au BufRead,BufNewFile *.go                               set filetype=go
au BufRead,BufNewFile *.slim,*.slimstache                set filetype=slim
au BufRead,BufNewFile *.frag,*.vert,*.fp,*.vp,*.glsl     set filetype=glsl
au BufRead,BufNewFile *.ejs,*.tag,*.mustache             set filetype=html
au BufRead,BufNewFile *.hamstache                        set filetype=haml
" This will enable pressing <CR> on a file in the quickfix and it will
" open a new window with that file
au BufReadPost quickfix nnoremap <buffer> <CR> <CR>
au BufWritePre * %s/\s\+$//e " Remove all trailing whitespace
au BufWritePre * :retab " Reformat tabs to spaces on save
au BufEnter * silent! checktime " check if there are changes to the file
