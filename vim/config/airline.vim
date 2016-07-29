" ------------------------------
"             AIRLINE
" ------------------------------
" remove separators
let g:airline_left_sep=''
let g:airline_right_sep=''
" remove unused modes
let g:airline#extensions#syntastic#enabled=0
" set second section to filename
let g:airline_section_b="%f"
" empty third and fourth sections
let g:airline_section_c=""
let g:airline_section_x=""
" put filetype in fifth section
let g:airline_section_y="%Y"
" this will make the ruby plugin less of a pain in the ass
let g:ruby_path = system('rvm current')
