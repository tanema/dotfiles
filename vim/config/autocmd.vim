" ------------------------------
"        Auto Command
" ------------------------------
if has("autocmd")
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
  au BufRead,BufNewFile *.cs                               set filetype=cs
  au BufRead,BufNewFile *.ejs,*.tag,*.mustache             set filetype=html
  au BufRead,BufNewFile *.hamstache                        set filetype=haml

  " specify autocomplete for unrecognized file types
  au FileType ruby,eruby set omnifunc=rubycomplete#Complete
  au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  au FileType html       set omnifunc=htmlcomplete#CompleteTags
  au FileType css        set omnifunc=csscomplete#CompleteCSS
  au FileType cs         set omnifunc=OmniSharp#Complete

  " This will enable pressing <CR> on a file in the quickfix and it will
  " open a new window with that file
  autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

  " Remove all trailing whitespace
  au BufWritePre * %s/\s\+$//e
  " run neomake on every buffer write
  au! BufWritePost * Neomake
endif

augroup checktime
    au!
    if !has("gui_running")
        "silent! necessary otherwise throws errors when using command
        "line window.
        autocmd BufEnter        * silent! checktime
        autocmd CursorHold      * silent! checktime
        autocmd CursorHoldI     * silent! checktime
        "these two _may_ slow things down. Remove if they do.
        autocmd CursorMoved     * silent! checktime
        autocmd CursorMovedI    * silent! checktime
    endif
augroup END
