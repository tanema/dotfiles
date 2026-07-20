return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
	settings = {
		disable_codeactions = true, -- refactor on this lsp for some reason changes param orders
		Lua = {
			["$schema"] = "https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json",
			diagnostics = {
				globals = { "vim" },
			},
			signatureHelp = { enabled = true },
			workspace = {
				library = { vim.env.VIMRUNTIME .. "/lua" },
				checkThirdParty = false,
			},
			type = {
				checkTableShape = true
			}
		},
	},
}
