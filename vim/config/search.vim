command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif
