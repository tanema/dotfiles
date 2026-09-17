local colors = require("colorscheme").colors

vim.api.nvim_set_hl(0, "SLNormal", { fg = colors.bg, bg = colors.cyan })
vim.api.nvim_set_hl(0, "SLInsert", { fg = colors.fg, bg = colors.green })
vim.api.nvim_set_hl(0, "SLVisual", { fg = colors.fg, bg = colors.red })
vim.api.nvim_set_hl(0, "SLSelect", { fg = colors.fg, bg = colors.yellow })
vim.api.nvim_set_hl(0, "SLReplace", { fg = colors.fg, bg = colors.yellow })
vim.api.nvim_set_hl(0, "SLCommand", { fg = colors.fg, bg = colors.orange })
vim.api.nvim_set_hl(0, "SLConfirm", { fg = colors.fg, bg = colors.purple })
vim.api.nvim_set_hl(0, "SLTerminal", { fg = colors.fg, bg = colors.purple })
vim.api.nvim_set_hl(0, "User1", { fg = colors.fg, bg = colors.bg })

local mode_map = {
  n = { "SLNormal", "Normal" },
  v = { "SLVisual", "Visual" },
  V = { "SLVisual", "Visual" },
  ["\x16"] = { "SLVisual", "Visual" },
  s = { "SLSelect", "Select" },
  S = { "SLSelect", "Select" },
  ["\x13"] = { "SLSelect", "Select" },
  i = { "SLInsert", "Insert" },
  R = { "SLReplace", "Replace" },
  c = { "SLCommand", "Command" },
  r = { "SLConfirm", "Confirm" },
  t = { "SLTerminal", "Terminal" },
  ["!"] = { "SLTerminal", "Shell" },
}

local function mode_info()
  local m = vim.api.nvim_get_mode().mode
  return mode_map[m] or mode_map[m:sub(1, 1)] or { "SLNormal", "" }
end

_G.modeHl = function() return "%#" .. mode_info()[1] .. "#" end
_G.modeName = function() return mode_info()[2] end

vim.go.statusline =
  "%{%v:lua.modeHl()%} ● %1* %<%F:%l:%c %{%v:lua.modeHl()%}%=%y%1*│%1* [%1p%%] %{%v:lua.modeHl()%} %{v:lua.modeName()} "

-- CmdlineEnter/Leave don't automatically redraw the statusline.
-- vim.schedule defers until after Neovim finishes the mode transition.
vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
  callback = function() vim.schedule(vim.cmd.redrawstatus) end,
})
