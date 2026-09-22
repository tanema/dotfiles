-- LSP setup, enabling configured LSPs
-- see lsp directory for configuration of these.
vim.lsp.enable({
  "clangd",
  "css",
  "ebnf",
  "golang",
  "html",
  "json",
  "lua",
  "markdown",
  "ruby",
  "rust",
  "stylua",
  "svelte",
  "typescript",
  "yaml",
  "zig",
})

local support = require("lsp_support")
local lspFmtGroup = vim.api.nvim_create_augroup("lsp-auto-format")
vim.api.nvim_create_autocmd("LspAttach", {
  group = lspFmtGroup,
  desc = "Attach LSP to autocomplete and auto formatting",
  callback = function(attach_evt)
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = lspFmtGroup,
      buffer = attach_evt.buf,
      callback = support.autoFormat(attach_evt),
    })
  end,
})
