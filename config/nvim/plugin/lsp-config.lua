local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<C-Space>'] = cmp.mapping.complete(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  })
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    "lua_ls",
    "gopls",
    "ts_ls",
    "marksman",
    "rust_analyzer",
  },
  automatic_installation = true,
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function ()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup {settings = {Lua = {diagnostics = {globals = { "vim" }}}}}
    end,
  },
})
