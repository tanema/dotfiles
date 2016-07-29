if has('nvim')
  " use esc to exit insert mode in terminal
  tnoremap <Esc> <C-\><C-n>
  " tab and window quick term shortcuts
  nnoremap <BS> <C-W>h
  nnoremap To :e term://zsh<CR>
  nnoremap Te :tabe term://zsh<CR>
  nnoremap Tv :vsplit term://zsh<CR>
  nnoremap Th :split term://zsh<CR>

  " window movement shortcuts
  tnoremap <BS> <C-W>h
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
endif
