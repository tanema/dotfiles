" Statusline
let g:currentmode={
  \ '__' : '------',
  \ 'n'  : 'NORMAL',
  \ 'i'  : 'INSERT',
  \ 'R'  : 'REPLACE',
  \ 'r'  : 'REPLACE',
  \ 'v'  : 'VISUAL',
  \ 'V'  : 'V-LINE',
  \ 'c'  : 'COMMAND',
  \ '' : 'V-BLOCK',
  \ 's'  : 'SELECT',
  \ 'S'  : 'S-LINE',
  \ '' : 'S-BLOCK',
  \ 't'  : 'TERMINAL',
  \ }

" Automatically change the statusline color depending on mode
function! Mode()
  if (mode() ==# 'v' || mode() ==# 'V' || mode() ==# '')
    exe 'hi! StatusLine ctermfg=195 ctermbg=25'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermfg=193 ctermbg=22'
  else
    exe 'hi! StatusLine ctermfg=231 ctermbg=240'
  endif
  return g:currentmode[mode()]
endfunction

function! FileStatus()
  let status = (&readonly || !&modifiable?  '✖︎' : '') . (&modified ? '✎' : '')
  if status == ''
    return ''
  endif
  return status . ' '
endfunction

hi User1 ctermfg=186
hi User2 ctermfg=71
hi User3 ctermfg=167

set laststatus=2
set statusline=
set statusline+=%{Mode()} " Edit mode
set statusline+=%3*%{FileStatus()}%h%w " File flags
set statusline+=%2*%f
set statusline+=%= " Space
set statusline+=%* " Reset Color
set statusline+=%{(&fenc!=''?&fenc:&enc)} " file encode
set statusline+=%y " file type
set statusline+=%{&ff}\  " file format
set statusline+=\[%p%%\] " line percent
