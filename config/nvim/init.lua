-- plugins
vim.pack.add({
	'https://github.com/stevearc/conform.nvim',        -- autoformat
	'https://github.com/nvim-lua/plenary.nvim',        -- dependency for telescope
	'https://github.com/nvim-telescope/telescope.nvim', -- fuzzy interactive file finder
	'https://github.com/leafOfTree/vim-svelte-plugin', -- svelte syntax
	'https://github.com/Mofiqul/dracula.nvim',
})

-- LSP setup, enabling configured LSPs
-- see lsp directory for configuration of these.
vim.lsp.enable {
	'clangd', 'golang', 'lua', 'markdown',
	'ruby', 'rust', 'typescript', 'zig', 'yaml',
	'html', 'json', 'css', 'svelte'
}

vim.cmd.colorscheme('dracula')
