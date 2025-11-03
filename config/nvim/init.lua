local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"tpope/vim-surround", -- surround highlighted text
	"tpope/vim-vinegar", -- make netrw easier to use and navigate
	"tpope/vim-fugitive", -- git plugin for vim
	"tpope/vim-commentary", -- comment out selected blocks
	"tpope/vim-sleuth", -- set buffer options based on current file
	{
		"airblade/vim-gitgutter",
		init = function()
			vim.g.gitgutter_override_sign_column_highlight = 0
			vim.g.gitgutter_sign_added = "●"
			vim.g.gitgutter_sign_modified = "●"
			vim.g.gitgutter_sign_removed = "●"
			vim.g.gitgutter_sign_removed_first_line = "●"
			vim.g.gitgutter_sign_modified_removed = "●"
		end,
	},
	{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/nvim-cmp",
	"sbdchd/neoformat",
	{ "metalelf0/jellybeans-nvim", dependencies = { "rktjmp/lush.nvim" } },
})

vim.cmd.colorscheme("jellybeans-nvim")
