vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	desc = "Auto jump to last position",
	group = vim.api.nvim_create_augroup("auto-last-position", { clear = true }),
	callback = function(args)
		local position = vim.api.nvim_buf_get_mark(args.buf, [["]])
		local winid = vim.fn.bufwinid(args.buf)
		pcall(vim.api.nvim_win_set_cursor, winid, position)
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	desc = "Fix style changes on save.",
	group = vim.api.nvim_create_augroup("style-fix-on-save", { clear = true }),
	callback = function()
		vim.cmd.retab() -- fix tabs
		vim.cmd("silent Neoformat") -- fix style
		vim.cmd([[%s/\s\+$//e]]) -- remove space at the end of each line
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
