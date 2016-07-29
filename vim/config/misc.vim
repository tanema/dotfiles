" ------------------------------
"             Misc
" ------------------------------
" folding space key in normal
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
"clear search highlight with backspace
nmap <BS> :noh<CR>
" toggle spell check
nnoremap <F3> :set spell!<CR>
" quick find all
nnoremap fa :Fa **/*
