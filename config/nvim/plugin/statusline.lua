-- all config that concerns setting our own custom status line
vim.g.modeNameMap = {
	n  = 'Normal',
	no = 'Normal·Operator Pending',
	v  = 'Visual',
	V  = 'V·Line',
	[''] = 'V·Block',
	s  = 'Select',
	S  = 'S·Line',
	[''] = 'S·Block',
	i  = 'Insert',
	R  = 'Replace',
	Rv = 'V·Replace',
	c  = 'Command',
	cv = 'Vim Ex',
	ce = 'Ex',
	r  = 'Prompt',
	rm = 'More',
	['r?'] = 'Confirm',
	['!']  = 'Shell',
	t  = 'Terminal'
}

vim.opt.statusline = "%0* ● %1* %<%F:%l:%c %2*%=%y%3*│%1* [%3p%%] %0* %{g:modeNameMap[mode()]} "

-- status line support
vim.api.nvim_create_autocmd({"InsertEnter"}, {
	callback = function()
		vim.api.nvim_set_hl(0, 'statusline', {fg = 'black', bg = '#d7afff', ctermfg = 'black', ctermbg = 'magenta'})
	end,
})

vim.api.nvim_create_autocmd({"InsertLeave"}, {
	callback = function()
		vim.api.nvim_set_hl(0, 'statusline', {fg = 'black', bg = '#8fbfdc', ctermfg = 'black', ctermbg = 'cyan'})
	end,
})

vim.api.nvim_set_hl(0, 'statusline', {fg = 'black', bg = '#8fbfdc', ctermfg = 'black', ctermbg = 'cyan'})
vim.api.nvim_set_hl(0, 'User1', {fg = '#adadad', bg = '#4e4e4e', ctermfg = 7, ctermbg = 239})
vim.api.nvim_set_hl(0, 'User2', {fg = '#adadad', bg = '#303030', ctermfg = 7, ctermbg = 236})
vim.api.nvim_set_hl(0, 'User3', {fg = '#303030', bg = '#303030', ctermfg = 236, ctermbg = 236})
vim.api.nvim_set_hl(0, 'User3', {fg = '#4e4e4e', bg = '#4e4e4e', ctermfg = 239, ctermbg = 239})
