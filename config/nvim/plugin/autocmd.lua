vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	desc = "Auto jump to last position",
	group = vim.api.nvim_create_augroup("auto-last-position", { clear = true }),
	callback = function(args)
		local position = vim.api.nvim_buf_get_mark(args.buf, [["]])
		local winid = vim.fn.bufwinid(args.buf)
		pcall(vim.api.nvim_win_set_cursor, winid, position)
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Attach LSP to autocomplete and auto formatting",
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
		if not client:supports_method('textDocument/willSaveWaitUntil') and client:supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = vim.api.nvim_create_augroup('auto-format', { clear = false }),
				buffer = ev.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
				end,
			})
		end
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
