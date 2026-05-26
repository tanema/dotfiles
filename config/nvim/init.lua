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

vim.g.gitgutter_override_sign_column_highlight = 0
vim.g.gitgutter_sign_added = "●"
vim.g.gitgutter_sign_modified = "●"
vim.g.gitgutter_sign_removed = "●"
vim.g.gitgutter_sign_removed_first_line = "●"
vim.g.gitgutter_sign_modified_removed = "●"

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	"tpope/vim-surround",    -- surround highlighted text
	"tpope/vim-vinegar",     -- make netrw easier to use and navigate
	"tpope/vim-fugitive",    -- git plugin for vim
	"tpope/vim-commentary",  -- comment out selected blocks
	"airblade/vim-gitgutter", -- show git changes in gutter
	'stevearc/conform.nvim', -- autoformat
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "metalelf0/jellybeans-nvim",     dependencies = { "rktjmp/lush.nvim" } },
})

-- see lsp directory for configuration of these.
vim.lsp.enable { "clangd", "golang", "lua", "markdown", "ruby", "rust", "typescript" }
vim.cmd.colorscheme("jellybeans-nvim")
