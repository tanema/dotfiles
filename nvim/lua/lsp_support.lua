local function initialize(evt)
  local client = assert(vim.lsp.get_client_by_id(evt.data.client_id))

  if client:supports_method("textDocument/completion") then
    vim.lsp.completion.enable(true, client.id, evt.buf, { autotrigger = true })
  end

  if client:supports_method("textDocument/inlineCompletion") then
    vim.lsp.inline_completion.enable(true, { bufnr = evt.buf, client_id = client.id })
  end

  if client:supports_method("textDocument/codeLens") then
    vim.lsp.codelens.enable(true, { bufnr = evt.buf, client_id = client.id })
  end

  if client:supports_method("textDocument/inlayHint") then
    vim.lsp.inlay_hint.enable(true, { bufnr = evt.buf, client_id = client.id })
  end

  if client:supports_method("textDocument/linkedEditingRange") then
    vim.lsp.linked_editing_range.enable(true, { bufnr = evt.buf, client_id = client.id })
  end

  return client
end

local function callAutoFormat(client)
  if
    client:supports_method("textDocument/willSaveWaitUntil") or not client:supports_method("textDocument/formatting")
  then
    return
  end

  vim.lsp.buf.format({ timeout_ms = 1000, async = false })
end

local function autoCodeActionFormat(client)
  local settings = (client.config.settings or {})
  local options = (settings.autoFormat or {})
  local supportsAutoCodeAction = client:supports_method("textDocument/codeAction")
    and type(options.codeActions) == "table"

  if not supportsAutoCodeAction then return end

  vim.lsp.buf.code_action({ context = { only = options.codeActions, triggerKind = 2 }, apply = true })
end

-- autoformat enables all features needed, and returns a callback to be used in
-- the BufWritePre autocmd.
local function autoFormat(evt)
  local client = initialize(evt)
  return function()
    callAutoFormat(client)
    autoCodeActionFormat(client)
  end
end

return {
  autoFormat = autoFormat,
}
