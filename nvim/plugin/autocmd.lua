local gitgutter = require("gitgutter")

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  desc = "Automatically opens quickfix when needed.",
  group = vim.api.nvim_create_augroup("AutoQuickfix", { clear = true }),
  pattern = "[^l]*", -- Targets all quickfix commands (excludes location list commands like :lgrep)
  callback = function() vim.cmd("cwindow") end, -- Opens quickfix
})

-- git-gutter port of only the stuff I use
vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "BufEnter", "FocusGained" }, {
  group = vim.api.nvim_create_augroup("gitgutter", { clear = true }),
  callback = function(args) gitgutter.update(args.buf) end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Auto jump to last position",
  group = vim.api.nvim_create_augroup("auto-last-position", { clear = true }),
  callback = function(args)
    local position = vim.api.nvim_buf_get_mark(args.buf, [["]])
    local winid = vim.fn.bufwinid(args.buf)
    pcall(vim.api.nvim_win_set_cursor, winid, position)
  end,
})

vim.api.nvim_create_autocmd("CursorHold", {
  desc = "Diagnostic window open on cursor hold over issue.",
  group = vim.api.nvim_create_augroup("diag-open-float", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, {
      scope = "cursor",
      header = false,
      focusable = false,
      source = "if_many",
      close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre", "WinLeave" },
    })
  end,
})
