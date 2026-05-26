return {
	cmd = { 'gopls' },
	filetypes = { 'go', 'gomod', 'gowork' },
	root_markers = { 'go.mod', '.git', },
	settings = {
		gopls = {
			staticcheck = true,
			gofumpt = true,
			usePlaceholders = true,
			buildFlags = { "-tags=integration" },
			analyses = { unusedparams = true, shadow = true },
		},
	},
}
