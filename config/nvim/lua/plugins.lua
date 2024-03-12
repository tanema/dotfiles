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
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
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
  'sbdchd/neoformat',
})
