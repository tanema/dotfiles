" Add the Ag command for searching
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor " Use ag over grep
endif
