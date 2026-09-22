local commentary = require("commentary")
local surround = require("surround")

local telescope = {
	find = ":lua require('telescope.builtin').find_files()<CR>",
	grep = ":lua require('telescope.builtin').live_grep()<CR>",
}

local function runCurrentFile()
	local fileName = vim.fn.expand("%")
	vim.cmd("vsplit")
	vim.cmd("terminal " .. vim.fn.shellescape(fileName))
	vim.api.nvim_feedkeys("i", "n", false) -- Enter insert mode, moves to end of prompt if there's one
end

local autocmpl = {
	select = function() return vim.fn.pumvisible() ~= 0 and "<C-y>" or "<CR>" end,
	next = function() return vim.fn.pumvisible() ~= 0 and "<C-n>" or "<TAB>" end,
	prev = function() return vim.fn.pumvisible() ~= 0 and "<C-p>" or "<s-TAB>" end,
}

-- Keymap config in table so that it feels easier to me to add mappings
local keymap = {
	{ { "i" },      "<CR>",      autocmpl.select,               { desc = "select item in autocomplete", expr = true } },
	{ { "i" },      "<tab>",     autocmpl.next,                 { desc = "next item in autocomplete", expr = true } },
	{ { "i" },      "<s-tab>",   autocmpl.prev,                 { desc = "prev item in autocomplete", expr = true } },
	{ { "n", "v" }, "d",         '"_d',                         { desc = "delete without yanking contents" } },
	{ { "n", "v" }, "D",         '"_D',                         { desc = "delete line without yanking contents" } },
	{ { "n", "v" }, "c",         '"_c',                         { desc = "change without yanking contents" } },
	{ { "n", "v" }, "C",         '"_C',                         { desc = "change line without yanking contents" } },
	{ { "v" },      "p",         '"_dP',                        { desc = "Pasting over hightlight, delete text first" } },
	{ { "n" },      "<BS>",      ":noh<CR>",                    { desc = "clear search highlight with backspace" } },
	{ { "n" },      "<C-P>",     telescope.find,                { desc = "ctrl-p to search for files" } },
	{ { "n" },      "<C-F>",     telescope.grep,                { desc = "ctrl-f to live grep" } },
	{ { "n" },      "<tab>",     "gt",                          { desc = "Tab for quick next tab" } },
	{ { "n" },      "<s-tab>",   "gT",                          { desc = "Tab for quick previous tab" } },
	{ { "n" },      "<C-h>",     "<C-w>h",                      { desc = "ctrl-h to quick move to left window" } },
	{ { "n" },      "<C-j>",     "<C-w>j",                      { desc = "ctrl-j to quick move to lower window" } },
	{ { "n" },      "<C-k>",     "<C-w>k",                      { desc = "ctrl-k to quick move to upper window" } },
	{ { "n" },      "<C-l>",     "<C-w>l",                      { desc = "ctrl-l to quick move to right window" } },
	{ { "n" },      "<C-=>",     "<C-w>=",                      { desc = "ctrl-= to make all windows the same size" } },
	{ { "n" },      "K",         vim.lsp.buf.hover,             { desc = "LSP hover documentation" } },
	{ { "n" },      "gd",        vim.lsp.buf.definition,        { desc = "Go to definition" } },
	{ { "n" },      "gi",        vim.lsp.buf.implementation,    { desc = "Go to implementation" } },
	{ { "n" },      "gr",        vim.lsp.buf.references,        { desc = "Show references" } },
	{ { "n", "i" }, "<C-k>",     vim.lsp.buf.signature_help,    { desc = "LSP hover signature help" } },
	{ { "n" },      "<leader>f", ':!echo "%" | pbcopy<CR><CR>', { desc = "quickly copy filename of current file" } },
	{ { "n" },      "<leader>r", runCurrentFile,                { desc = "run current file" } },
	{ { "x" },      "gc",        commentary.cmd,                { desc = "Toggle comment on selection" } },
	{ { "n" },      "cs",        surround.change_surround,      { desc = "Change surrounding" } },
	{ { "n" },      "ds",        surround.delete_surround,      { desc = "Delete surrounding" } },
	{ { "x" },      "S",         surround.cmd,                  { desc = "Surround visual selection" } },
}

for _, params in ipairs(keymap) do
	vim.keymap.set(unpack(params))
end
