vim.api.nvim_create_autocmd({"BufReadPost"}, {
  desc = "Restore cursor position and refresh if any changes when loading a buffer",
  callback = function()
    local lastpos = vim.fn.line("'\"")
    if lastpos > 0 or lastpos <= vim.fn.line("$") then
      vim.cmd.normal("'\"")
    end
    vim.cmd.checktime();
  end,
})

vim.api.nvim_create_autocmd({"BufWritePre"}, {
  desc = "Fix style changes on save.",
  callback = function()
    -- fix tabs
    vim.cmd.retab()
    -- fix style
    vim.cmd("silent Neoformat")
    -- remove space at the end of each line
    vim.cmd([[%s/\s\+$//e]])
  end,
})
