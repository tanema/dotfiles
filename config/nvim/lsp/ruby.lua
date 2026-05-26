return {
	cmd = { vim.fn.expand("~/.rbenv/shims/ruby-lsp") },
	root_markers = { "Gemfile", ".git" },
	filetypes = { 'ruby', 'eruby' },
	settings = {
		formatter = 'auto',
		linters = { 'standard' },
		addonSettings = {
			["Ruby LSP Rails"] = { enablePendingMigrationsPrompt = false },
		},
	},
}
