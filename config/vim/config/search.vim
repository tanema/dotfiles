" Add the Ag command for searching
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore=logs\ --ignore=node_modules\ --ignore=vendor " Use ag over grep
endif
