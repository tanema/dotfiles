vim.api.nvim_create_autocmd({"BufReadPost"}, {
  desc = "Restore cursor position and refresh if any changes when loading a buffer",
  callback = function()
    -- Restore cursor position
    if vim.fn.line("'\"") > 0 or vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd("norm '\"")
    else
      vim.cmd("norm $")
    end
    -- check if there are changes to the file
    vim.cmd("checktime")
  end,
})

vim.api.nvim_create_autocmd({"BufWritePre"}, {
  desc = "Fix style changes on save.",
  callback = function()
    vim.cmd("silent Neoformat")
  end,
})
