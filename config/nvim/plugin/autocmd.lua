local fileUtils = require('fileutils')
local gitgutter = require('gitgutter')

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
	desc = "Automatically opens quickfix when needed.",
	group = vim.api.nvim_create_augroup("AutoQuickfix", { clear = true }),
	pattern = "[^l]*",                           -- Targets all quickfix commands (excludes location list commands like :lgrep)
	callback = function() vim.cmd("cwindow") end, -- Opens quickfix
})

-- vim-vinegar type navigation
-- TODO reminder we wont need this in nvim 0.13.x
-- https://www.reddit.com/r/neovim/comments/1uh24id/new_builtin_directory_viewer/
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'netrw',
	callback = function(ev)
		vim.keymap.set('n', '-', fileUtils.navigateUp, { desc = 'Navigate up', buffer = ev.buf })
		vim.keymap.set('n', '~', ':edit ~/<CR>', { desc = 'Open $HOME', buffer = ev.buf })
	end,
})

-- git-gutter port of only the stuff I use
vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWritePost', 'BufEnter', 'FocusGained' }, {
	group = vim.api.nvim_create_augroup('gitgutter', { clear = true }),
	callback = function(args) gitgutter.update(args.buf) end,
})

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

		if client:supports_method('textDocument/inlineCompletion') then
			vim.lsp.inline_completion.enable(true, { bufnr = ev.buf, client_id = client.id })
		end

		if not client:supports_method('textDocument/willSaveWaitUntil') and client:supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = vim.api.nvim_create_augroup('auto-format', { clear = false }),
				buffer = ev.buf,
				callback = function(evt)
					if client.config.settings and not client.config.settings.disable_codeactions then
						local params = vim.lsp.util.make_range_params()
						params.context = { only = { "source.organizeImports" } }
						local result = vim.lsp.buf_request_sync(evt.buf, "textDocument/codeAction", params)
						for _, res in pairs(result or {}) do
							for _, r in pairs(res.result or {}) do
								if r.edit then
									local enc = client.offset_encoding or "utf-16"
									vim.lsp.util.apply_workspace_edit(r.edit, enc)
								end
							end
						end
					end

					vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000, async = false })
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
