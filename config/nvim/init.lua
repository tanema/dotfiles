local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  {'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' }},
  'nvim-treesitter/nvim-treesitter',
  'BurntSushi/ripgrep',
  'tpope/vim-surround',
  'tpope/vim-vinegar',
  'tpope/vim-fugitive',
  'tpope/vim-commentary',
  'airblade/vim-gitgutter',
  'nanotech/jellybeans.vim',
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/nvim-cmp',
  'L3MON4D3/LuaSnip',
  'sbdchd/neoformat',
})

local ignoreFiles = {
  "^\\./$",
  ".DS_Store",
  ".git/",
  "*.pyc",
  "node_modules/",
  "dist/",
  "build/",
}


vim.g.modeNameMap = {
  n  = 'Normal',
  no = 'Normal·Operator Pending',
  v  = 'Visual',
  V  = 'V·Line',
  [''] = 'V·Block',
  s  = 'Select',
  S  = 'S·Line',
  [''] = 'S·Block',
  i  = 'Insert',
  R  = 'Replace',
  Rv = 'V·Replace',
  c  = 'Command',
  cv = 'Vim Ex',
  ce = 'Ex',
  r  = 'Prompt',
  rm = 'More',
  ['r?'] = 'Confirm',
  ['!']  = 'Shell',
  t  = 'Terminal'
}

vim.cmd.colorscheme('jellybeans')
vim.opt.laststatus = 2
vim.opt.showmode = false
vim.opt.statusline = "%5* ● %1* %<%F:%l:%c %2*%=%y%3*│%1* [%3p%%] %5* %{g:modeNameMap[mode()]} "
vim.opt.tabstop = 2         -- numbers of spaces of tab character
vim.opt.shiftwidth = 2      -- numbers of spaces to (auto)indent
vim.opt.scrolloff = 10      -- keep 10 lines above and below cursor while scrolling
vim.opt.writebackup = false -- no write backup
vim.opt.swapfile = false    -- no swap files either they are a pain in the ass
vim.opt.number = true       -- show line numbers
vim.opt.ignorecase = true   -- ignore case when searching
vim.opt.title = true        -- show title in console title bar
vim.opt.shortmess= "atI"    -- Abbreviate messages
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
vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro' -- order setting
vim.g.netrw_localrmdir = 'rm -r'                         -- Allow netrw to remove non-empty local directories
vim.g.netrw_list_hide = table.concat(ignoreFiles, ",")
-- Block out the no-go zone of long lines
local colorColumns = {"80"}
for i = 120,200 do table.insert(colorColumns, i) end
vim.opt.colorcolumn = colorColumns
 
-- autocommand
vim.api.nvim_create_autocmd({"BufReadPost"}, {
  desc = "Restore cursor position and refresh if any changes when loading a buffer",
  callback = function(ev)
    -- Restore cursor position
    if vim.fn.line("'\"") > 0 or vim.fn.line("'\"") <= vim.fn.line("$") then 
      vim.cmd("norm '\"")
    else
      vim.cmd("norm $")
    end
    -- check if there are changes to the file
    vim.cmd("checktime")
  end,
})


vim.g.neoformat_try_formatprg = true
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"typescript", "javascript", "css", "html", "markdown"},
  callback = function(args)
    vim.opt_local.formatprg = 'prettierd\\ --parser\\ ' .. args.match
  end,
})

vim.api.nvim_create_autocmd({"BufWritePre"}, {
  desc = "Fix style changes on save.",
  callback = function(ev)
    vim.cmd("silent Neoformat")
  end,
})

-- set spelling on for git commits
vim.api.nvim_create_autocmd({"FileType"}, {
  desc = "Enable spelling for a git commit buffer",
  pattern = {"gitcommit"},
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- search
vim.api.nvim_create_user_command('Find', 'grep! <args>|cwindow|redraw!', { nargs = "+" })
if vim.fn.executable('rg') then -- Use ag over grep
  local agIgnores = {}
  for i, pattern in ipairs(ignoreFiles) do
    table.insert(agIgnores, "-g='!"..pattern.."'")
  end
  vim.opt.grepprg = "rg --vimgrep " .. table.concat(agIgnores, " ") 
end

-- Keyboard
-- make delete work like other applications
vim.keymap.set({"n", "v"}, "d", '"_d')
vim.keymap.set({"n", "v"}, "D", '"_D')
vim.keymap.set({"n", "v"}, "c", '"_c')
vim.keymap.set({"n", "v"}, "C", '"_C')
vim.keymap.set({"v"}, "p", '"_dP')
-- clear search highlight with backspace
vim.keymap.set({"n"}, "<BS>", ":noh<CR>")
-- Ctr-P action
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
vim.keymap.set({"n"}, "<leader>y", ":!cat %\\|pbcopy<CR><CR>")
-- copy the current filename
vim.keymap.set({"n"}, "<leader>f", ":!echo %\\|pbcopy<CR><CR>")

-- status line support
vim.cmd([[
hi User1 ctermfg=007   ctermbg=239     guibg=#4e4e4e guifg=#adadad
hi User2 ctermfg=007   ctermbg=236     guibg=#303030 guifg=#adadad
hi User3 ctermfg=236   ctermbg=236     guibg=#303030 guifg=#303030
hi User4 ctermfg=239   ctermbg=239     guibg=#4e4e4e guifg=#4e4e4e
hi User5 ctermfg=black ctermbg=cyan    guibg=#8fbfdc guifg=black 
]])

local lsp_zero = require('lsp-zero')
-- see :help lsp-zero-keybindings to learn the available actions
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<C-Space>'] = cmp.mapping.complete(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  })
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    "lua_ls",
    "gopls",
    "tsserver",
    "marksman",
    "rust_analyzer",
  },
  handlers = { lsp_zero.default_setup },
})

