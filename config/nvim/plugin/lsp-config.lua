local lsp_zero = require("lsp-zero")
lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

local cmp = require("cmp")
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
	}),
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

vim.lsp.config("gopls", {
	settings = {
		gopls = {
			buildFlags = { "-tags=integration" },
		},
	},
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "gopls", "ts_ls", "marksman", "rust_analyzer", "clangd" },
	automatic_installation = true,
})
