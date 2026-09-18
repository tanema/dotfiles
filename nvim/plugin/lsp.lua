vim.lsp.codelens.enable()
vim.lsp.inlay_hint.enable()
vim.lsp.linked_editing_range.enable()
vim.lsp.inline_completion.enable()

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
  "svelte",
  "typescript",
  "yaml",
  "zig",
})
