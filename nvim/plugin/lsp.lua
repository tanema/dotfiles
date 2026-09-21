vim.lsp.codelens.enable()
vim.lsp.inlay_hint.enable()
vim.lsp.linked_editing_range.enable()
vim.lsp.inline_completion.enable()

-- LSP setup, enabling configured LSPs
-- see lsp directory for configuration of these.
vim.lsp.enable({
  "ccls",
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
