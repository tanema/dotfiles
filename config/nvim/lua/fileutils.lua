return {
	runCurrent = function()
		local fileName = vim.fn.expand("%")
		vim.cmd("vsplit")
		vim.cmd("terminal " .. vim.fn.shellescape(fileName))
		vim.api.nvim_feedkeys("i", "n", false) -- Enter insert mode, moves to end of prompt if there's one
	end,
	openFileDir = function()
		local dir = vim.fn.expand('%:p:h')
		vim.cmd('edit ' .. vim.fn.fnameescape(dir == '' and '.' or dir))
	end,
	navigateUp = function()
		local current = vim.b.netrw_curdir or vim.fn.expand('%:p:h')
		local parent = vim.fn.fnamemodify(current, ':h')
		local dirname = vim.fn.fnamemodify(current, ':t')
		vim.cmd('edit ' .. vim.fn.fnameescape(parent))
		vim.schedule(function() vim.fn.search('\\V' .. dirname .. '/', 'w') end)
	end,
}
