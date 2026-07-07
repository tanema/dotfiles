-- use `gra` to delete a package
-- checkout :help vim.pack-examples
-- checkout :help vim.pack.update()
vim.api.nvim_create_user_command('Pack', function()
	vim.pack.update(nil, { offline = true })
end, {})
