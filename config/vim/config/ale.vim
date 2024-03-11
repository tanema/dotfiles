let g:ale_linters = {
\  'ruby': ['rubocop'], 
\  'javascript': ['eslint'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
