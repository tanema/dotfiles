vim.opt.showmode = false
vim.opt.tabstop = 2 -- numbers of spaces of tab character
vim.opt.shiftwidth = 2 -- numbers of spaces to (auto)indent
vim.opt.scrolloff = 10 -- keep 10 lines above and below cursor while scrolling
vim.opt.writebackup = false -- no write backup
vim.opt.swapfile = false -- no swap files either they are a pain in the ass
vim.opt.number = true -- show line numbers
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.title = true -- show title in console title bar
vim.opt.splitright = true -- when vertical splitting set new window to the right
vim.opt.splitbelow = true -- when splitting the new window opens below
vim.opt.showmatch = true -- highlight matches
vim.opt.cursorline = true -- highlight current cursorline
vim.opt.wrap = false -- text wrap off eff that sheet
vim.opt.virtualedit = "all" -- this means we can go into empty spaces
vim.opt.list = true -- display hidden characters
vim.opt.listchars = "tab:→ ,nbsp:~,eol:$" -- set how hidden characters are displayed
vim.opt.clipboard:append("unnamed") -- use system clipboard
vim.opt.switchbuf:append("usetab,newtab") -- this will make it switch to a tab if I already have the file open and open the quickfix in a tab
vim.opt.termguicolors = true
vim.opt.updatetime = 100
vim.opt.completeopt = { -- tab complete opts
  "menu", -- Use a popup menu to show the possible completions.
  "menuone", -- Use the popup menu also when there is only one match.
  "noinsert", -- Do not insert any text for a match until the user selects a match from the menu.
  "popup", -- Show extra information about the currently selected completion in a popup window.
  "preview", -- Show extra information about the currently selected completion in the preview window.
  "fuzzy", -- Enable fuzzy-matching for completion candidates.
}
vim.opt.spelllang = "en_gb"

if vim.fn.executable("rg") then -- Use rg over grep
  vim.opt.grepprg = "rg --vimgrep --smart-case"
  vim.opt.grepformat = "%f:%l:%c:%m"
end

local colorColumns = { "80" }
for i = 120, 200 do
  table.insert(colorColumns, tostring(i))
end
vim.opt.colorcolumn = colorColumns

-- Add filetypes
vim.filetype.add({ extension = { ebnf = "ebnf" } })
