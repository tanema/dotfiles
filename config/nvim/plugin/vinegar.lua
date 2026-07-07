-- half assed lua port of vim-vinegar because I only ported the parts I use.
-- TODO reminder we wont need this in nvim 0.13.x
-- https://www.reddit.com/r/neovim/comments/1uh24id/new_builtin_directory_viewer/

local function navigateUp()
	local current = vim.b.netrw_curdir or vim.fn.expand('%:p:h')
	local parent = vim.fn.fnamemodify(current, ':h')
	local dirname = vim.fn.fnamemodify(current, ':t')
	vim.cmd('edit ' .. vim.fn.fnameescape(parent))
	vim.schedule(function() vim.fn.search('\\V' .. dirname .. '/', 'w') end)
end

-- In normal buffers, open the file's own directory
vim.keymap.set('n', '-', function()
	local dir = vim.fn.expand('%:p:h')
	vim.cmd('edit ' .. vim.fn.fnameescape(dir == '' and '.' or dir))
end, { desc = 'Open file directory' })

-- In netrw, override - to navigate up and ~ to go home
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'netrw',
	callback = function(ev)
		vim.keymap.set('n', '-', navigateUp, { desc = 'Navigate up', buffer = ev.buf })
		vim.keymap.set('n', '~', ':edit ~/<CR>', { desc = 'Open $HOME', buffer = ev.buf })
	end,
})
