" clear search highlight with backspace
nmap <BS> :noh<CR>
" Ctr-P action
nnoremap <C-P> :Files<CR>
" switch tab shortcuts
nmap <tab> gt
nmap <s-tab> gT
" window movement shortcuts
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-=> <C-w>=
" copy the contents of the current file
nnoremap <leader>y :!cat %\|pbcopy<CR><CR>
" copy the current filename
nnoremap <leader>f :!echo %\|pbcopy<CR><CR>
