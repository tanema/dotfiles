" ------------------------------
"             Ale
" ------------------------------
let g:ale_linters = {'ruby': ['rubocop']}
let g:ale_ruby_rubocop_executable = 'bundle'

let g:ale_sign_error = '🔥'
let g:ale_sign_warning = '🙈'

highlight clear ALEErrorSign
highlight clear ALEWarningSign

