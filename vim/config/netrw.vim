" ------------------------------
"           Netrw
" ------------------------------
let g:netrw_banner=0 " no banner
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro' " order setting
let g:netrw_list_hide= '.*\.swp$,\.DS_Store,.*\.meta,^\.\/$' "hide these files from listing
let g:netrw_localrmdir='rm -r' " Allow netrw to remove non-empty local directories

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
