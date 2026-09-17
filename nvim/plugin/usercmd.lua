-- use `gra` to delete a package
-- checkout :help vim.pack-examples
-- checkout :help vim.pack.update()
vim.api.nvim_create_user_command("Pack", function() vim.pack.update(nil, { offline = true }) end, {})
vim.api.nvim_create_user_command("PackUpdate", function(opts)
  vim.pack.update(nil, { force = true })
  -- I use PackUpdate! to update from command line `nvim . -c :PackUpdate!`
  if opts.bang then os.exit(0) end
end, { bang = true })
