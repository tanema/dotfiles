" ------------------------------
"             Functions
" ------------------------------
" find in all files
function FindAll(where, to_find)
  execute ":vimgrep " . a:to_find . " " . a:where . " | copen"
endfunction
command! -nargs=* Fa call FindAll(<f-args>)

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwKeyboardShortcuts()
augroup END

function! NetrwKeyboardShortcuts()
  noremap <buffer> to :e **/
  noremap <buffer> te :tabe **/
  noremap <buffer> tn :tabnew<CR>
  noremap <buffer> tv :vsp **/
  noremap <buffer> th :split **/
endfunction
