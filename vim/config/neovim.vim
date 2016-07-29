if has('nvim')
  " use esc to exit insert mode in terminal
  tnoremap <Esc> <C-\><C-n>
  " tab and window quick term shortcuts
  nnoremap To :e term://zsh<CR>
  nnoremap Te :tabe term://zsh<CR>
  nnoremap Tv :vsplit term://zsh<CR>
  nnoremap Th :split term://zsh<CR>
endif
