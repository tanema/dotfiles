-- files ignored in netrw and tabbing
local ignoreFiles = {
  "^\\./$",
  ".DS_Store",
  ".git/",
  "*.pyc",
  "node_modules/",
  "dist/",
  "build/",
}

vim.opt.laststatus = 2
vim.opt.showmode = false
vim.opt.tabstop = 2         -- numbers of spaces of tab character
vim.opt.shiftwidth = 2      -- numbers of spaces to (auto)indent
vim.opt.scrolloff = 10      -- keep 10 lines above and below cursor while scrolling
vim.opt.writebackup = false -- no write backup
vim.opt.swapfile = false    -- no swap files either they are a pain in the ass
vim.opt.number = true       -- show line numbers
vim.opt.ignorecase = true   -- ignore case when searching
vim.opt.title = true        -- show title in console title bar
vim.opt.splitright = true   -- when vertical splitting set new window to the right
vim.opt.splitbelow = true   -- when splitting the new window opens below
vim.opt.showmatch = true    -- highlight matches
vim.opt.cursorline = true   -- highlight current cursorline
vim.opt.wrap = false        -- text wrap off eff that sheet
vim.opt.virtualedit = "all" -- this means we can go into empty spaces
vim.opt.list = true         -- display hidden characters
vim.opt.listchars="tab:→ ,nbsp:~,eol:$"       -- set how hidden characters are displayed
vim.opt.clipboard:append("unnamed")           -- use system clipboard
vim.opt.switchbuf:append({"usetab","newtab"}) -- this will make it switch to a tab if I already have the file open and open the quickfix in a tab
vim.opt.wildmenu = true
vim.opt.wildignore = table.concat(ignoreFiles, ",")

local colorColumns = {"80"}
for i = 120,200 do table.insert(colorColumns, i) end
vim.opt.colorcolumn = colorColumns

vim.g.neoformat_try_formatprg = true
