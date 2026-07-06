return {
	cmd = { 'vscode-markdown-language-server', '--stdio' },
	filetypes = { 'markdown' },
	root_markers = { '.git' },
	init_options = {
		provideFormatter = true,
	},
	settings = {
		markdown = {
			validate = {
				enable = true,
			}
		}
	}
}
