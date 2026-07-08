return {
	select = function()
		return vim.fn.pumvisible() ~= 0 and '<C-y>' or '<CR>'
	end,
	next = function()
		return vim.fn.pumvisible() ~= 0 and '<C-n>' or '<TAB>'
	end,
	prev = function()
		return vim.fn.pumvisible() ~= 0 and '<C-p>' or '<s-TAB>'
	end,
}
