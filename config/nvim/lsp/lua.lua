return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      signatureHelp = { enabled = true },
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}
