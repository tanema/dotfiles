local telescope = require("telescope.builtin")
local insert, normal, normVis, visual = { "i" }, { "n" }, { "n", "v" }, { "v" }

local function runCurrentFile()
	local fileName = vim.fn.expand("%")
	vim.cmd("vsplit")
	vim.cmd("terminal " .. vim.fn.shellescape(fileName))
	vim.api.nvim_feedkeys("i", "n", false) -- Enter insert mode, moves to end of prompt if there's one
end

local function autoCompleteSelect()
	return vim.fn.pumvisible() ~= 0 and '<C-y>' or '<CR>'
end

local function autoCompleteNext()
	return vim.fn.pumvisible() ~= 0 and '<C-n>' or '<TAB>'
end

local function autoCompletePrev()
	return vim.fn.pumvisible() ~= 0 and '<C-p>' or '<s-TAB>'
end

-- Keymap config in table so that it feels easier to me to add mappings
local keymap = {
	{ insert,  "<CR>",      autoCompleteSelect,            { desc = "press enter to select item in autocomplete", expr = true, noremap = true } },
	{ insert,  "<tab>",     autoCompleteNext,              { desc = "press tab to select next item in autocomplete", expr = true, noremap = true } },
	{ insert,  "<s-tab>",   autoCompletePrev,              { desc = "press shift tab to select prev item in autocomplete", expr = true, noremap = true } },
	{ normVis, "d",         '"_d',                         { desc = "delete without yanking contents" } },
	{ normVis, "D",         '"_D',                         { desc = "delete line without yanking contents" } },
	{ normVis, "c",         '"_c',                         { desc = "change without yanking contents" } },
	{ normVis, "C",         '"_C',                         { desc = "change line without yanking contents" } },
	{ visual,  "p",         '"_dP',                        { desc = "Pasting over hightlight, delete text first" } },
	{ normal,  "<BS>",      ":noh<CR>",                    { desc = "clear search highlight with backspace" } },
	{ normal,  "<C-P>",     telescope.find_files,          { desc = "ctrl-p to search for files" } },
	{ normal,  "<C-F>",     telescope.live_grep,           { desc = "ctrl-f to live grep" } },
	{ normal,  "<tab>",     "gt",                          { desc = "Tab for quick next tab" } },
	{ normal,  "<s-tab>",   "gT",                          { desc = "Tab for quick previous tab" } },
	{ normal,  "<C-h>",     "<C-w>h",                      { desc = "ctrl-h to quick move to left window" } },
	{ normal,  "<C-j>",     "<C-w>j",                      { desc = "ctrl-j to quick move to lower window" } },
	{ normal,  "<C-k>",     "<C-w>k",                      { desc = "ctrl-k to quick move to upper window" } },
	{ normal,  "<C-l>",     "<C-w>l",                      { desc = "ctrl-l to quick move to right window" } },
	{ normal,  "<C-=>",     "<C-w>=",                      { desc = "ctrl-= to make all windows the same size" } },
	{ normal,  "<leader>f", ':!echo "%" | pbcopy<CR><CR>', { desc = "quickly copy filename of current file" } },
	{ normal,  "<leader>r", runCurrentFile,                { desc = "run current file" } },
}

for _, params in ipairs(keymap) do
	vim.keymap.set(unpack(params))
end
