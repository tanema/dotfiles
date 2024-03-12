-- make delete work like other applications
vim.keymap.set({"n", "v"}, "d", '"_d')
vim.keymap.set({"n", "v"}, "D", '"_D')
vim.keymap.set({"n", "v"}, "c", '"_c')
vim.keymap.set({"n", "v"}, "C", '"_C')
vim.keymap.set({"v"}, "p", '"_dP')
-- clear search highlight with backspace
vim.keymap.set({"n"}, "<BS>", ":noh<CR>")
-- Ctr-P and Ctrl-F action
local telescope = require('telescope.builtin')
vim.keymap.set({"n"}, "<C-P>", telescope.find_files)
vim.keymap.set({"n"}, "<C-F>", telescope.live_grep)
-- switch tab shortcuts
vim.keymap.set({"n"}, "<tab>", "gt")
vim.keymap.set({"n"}, "<s-tab>", "gT")
-- window movement shortcuts
vim.keymap.set({"n"}, "<C-h>", "<C-w>h")
vim.keymap.set({"n"}, "<C-j>", "<C-w>j")
vim.keymap.set({"n"}, "<C-k>", "<C-w>k")
vim.keymap.set({"n"}, "<C-l>", "<C-w>l")
vim.keymap.set({"n"}, "<C-=>", "<C-w>=")
-- copy the contents of the current file
vim.keymap.set({"n"}, "<leader>y", ':!cat "%" | pbcopy<CR><CR>')
-- copy the current filename
vim.keymap.set({"n"}, "<leader>f", ':!echo "%" | pbcopy<CR><CR>')
