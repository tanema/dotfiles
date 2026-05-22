 return {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.mod', '.git', },
  settings = {
    gopls = {
      buildFlags = { "-tags=integration" },
    },
  },
}
