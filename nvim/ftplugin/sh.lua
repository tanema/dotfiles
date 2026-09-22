-- Neovim's built-in .sh detector only recognizes shell dialects (bash/zsh/ksh/csh)
-- in the shebang and silently defaults to "sh" otherwise, so a .sh file with e.g.
-- a ruby or python shebang gets the wrong filetype. Re-run hashbang matching to fix it.
local shebang = vim.api.nvim_buf_get_lines(0, 0, 1, false)
if shebang[1] and shebang[1]:match("^#!") then
  local ft = vim.filetype.match({ contents = shebang })
  if ft and ft ~= "sh" then vim.bo.filetype = ft end
end
