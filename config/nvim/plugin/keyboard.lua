local autocmpl = require('autocomplete')
local surround = require('surround')
local fileutils = require("fileutils")

-- Keymap config in table so that it feels easier to me to add mappings
local keymap = {
	{ { "i" },      "<CR>",      autocmpl.select,                                       { desc = "press enter to select item in autocomplete", expr = true, noremap = true } },
	{ { "i" },      "<tab>",     autocmpl.next,                                         { desc = "press tab to select next item in autocomplete", expr = true, noremap = true } },
	{ { "i" },      "<s-tab>",   autocmpl.prev,                                         { desc = "press shift tab to select prev item in autocomplete", expr = true, noremap = true } },
	{ { "n", "v" }, "d",         '"_d',                                                 { desc = "delete without yanking contents" } },
	{ { "n", "v" }, "D",         '"_D',                                                 { desc = "delete line without yanking contents" } },
	{ { "n", "v" }, "c",         '"_c',                                                 { desc = "change without yanking contents" } },
	{ { "n", "v" }, "C",         '"_C',                                                 { desc = "change line without yanking contents" } },
	{ { "v" },      "p",         '"_dP',                                                { desc = "Pasting over hightlight, delete text first" } },
	{ { "n" },      "<BS>",      ":noh<CR>",                                            { desc = "clear search highlight with backspace" } },
	{ { "n" },      "<C-P>",     ":lua require('telescope.builtin').find_files()<CR>",  { desc = "ctrl-p to search for files" } },
	{ { "n" },      "<C-F>",     ":lua require('telescope.builtin').live_grep()<CR>",   { desc = "ctrl-f to live grep" } },
	{ { "n" },      "<tab>",     "gt",                                                  { desc = "Tab for quick next tab" } },
	{ { "n" },      "<s-tab>",   "gT",                                                  { desc = "Tab for quick previous tab" } },
	{ { "n" },      "<C-h>",     "<C-w>h",                                              { desc = "ctrl-h to quick move to left window" } },
	{ { "n" },      "<C-j>",     "<C-w>j",                                              { desc = "ctrl-j to quick move to lower window" } },
	{ { "n" },      "<C-k>",     "<C-w>k",                                              { desc = "ctrl-k to quick move to upper window" } },
	{ { "n" },      "<C-l>",     "<C-w>l",                                              { desc = "ctrl-l to quick move to right window" } },
	{ { "n" },      "<C-=>",     "<C-w>=",                                              { desc = "ctrl-= to make all windows the same size" } },
	{ { "n" },      'K',         vim.lsp.buf.hover,                                     { desc = 'Show hover' } },
	{ { "n" },      'gd',        vim.lsp.buf.definition,                                { desc = 'Go to definition' } },
	{ { "n" },      'gi',        vim.lsp.buf.implementation,                            { desc = 'Go to implementation' } },
	{ { "n" },      'gr',        vim.lsp.buf.references,                                { desc = 'Show references' } },
	{ { "n" },      "<leader>f", ':!echo "%" | pbcopy<CR><CR>',                         { desc = "quickly copy filename of current file" } },
	{ { "n" },      "<leader>r", fileutils.runCurrent,                                  { desc = "run current file" } },
	{ { 'n' },      '-',         fileutils.openFileDir,                                 { desc = 'Open file directory' } },
	{ { 'x' },      'gc',        ':<C-u>lua require("commentary").toggle()<CR>',        { desc = 'Toggle comment on selection' } },
	{ { 'n' },      'cs',        surround.change_surround,                              { desc = 'Change surrounding' } },
	{ { 'n' },      'ds',        surround.delete_surround,                              { desc = 'Delete surrounding' } },
	{ { 'x' },      'S',         ':<C-u>lua require("surround").surround_visual()<CR>', { desc = 'Surround visual selection' } },
}

for _, params in ipairs(keymap) do
	vim.keymap.set(unpack(params))
end
