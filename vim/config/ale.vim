let g:ale_linters = {'ruby': ['rubocop']}
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'

hi ALEErrorSign ctermfg=141
hi ALEWarningSign ctermfg=141

let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added = '●'
let g:gitgutter_sign_modified = '●'
let g:gitgutter_sign_removed = '●'
let g:gitgutter_sign_removed_first_line = '●'
let g:gitgutter_sign_modified_removed = '●'

hi DiffAdd    ctermfg=148 ctermbg=NONE cterm=bold guifg=#f8f8f2 guibg=#46830c gui=bold
hi DiffDelete ctermfg=197 ctermbg=NONE cterm=bold guifg=#8b0807 guibg=NONE    gui=NONE
hi DiffChange ctermfg=208 ctermbg=NONE cterm=bold guifg=#f8f8f2 guibg=#243955 gui=NONE
hi DiffText   ctermfg=231 ctermbg=24   cterm=bold guifg=#f8f8f2 guibg=#204a87 gui=bold
