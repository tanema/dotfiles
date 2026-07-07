vim.g.gitgutter_override_sign_column_highlight = 0
vim.g.gitgutter_sign_added = '●'
vim.g.gitgutter_sign_modified = '●'
vim.g.gitgutter_sign_removed = '●'
vim.g.gitgutter_sign_removed_first_line = '●'
vim.g.gitgutter_sign_modified_removed = '●'

-- plugins
vim.pack.add({
	'https://github.com/tpope/vim-surround',           -- surround highlighted text
	'https://github.com/airblade/vim-gitgutter',       -- show git changes in gutter
	'https://github.com/stevearc/conform.nvim',        -- autoformat
	'https://github.com/nvim-lua/plenary.nvim',        -- dependency for telescope
	'https://github.com/nvim-telescope/telescope.nvim', -- fuzzy interactive file finder
	'https://github.com/wtfox/jellybeans.nvim',        -- colorscheme
	'https://github.com/leafOfTree/vim-svelte-plugin'  -- svelte syntax
})

-- LSP setup, enabling configured LSPs
-- see lsp directory for configuration of these.
vim.lsp.enable {
	'clangd', 'golang', 'lua', 'markdown',
	'ruby', 'rust', 'typescript', 'zig', 'yaml',
	'html', 'json', 'css', 'svelte'
}

vim.cmd.colorscheme('jellybeans')
