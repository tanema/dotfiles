-- minimal port of vim-gitgutter to only show the gutter, I never used the commands
local ns = vim.api.nvim_create_namespace('gitgutter')

vim.api.nvim_set_hl(0, 'GitGutterAdd', { link = 'diffAdd', default = true })
vim.api.nvim_set_hl(0, 'GitGutterChange', { link = 'diffChange', default = true })
vim.api.nvim_set_hl(0, 'GitGutterDelete', { link = 'diffDelete', default = true })

local hl_map = { add = 'GitGutterAdd', change = 'GitGutterChange', delete = 'GitGutterDelete' }

local function parse_diff(output)
	local signs = {}
	local new_line = 0
	local pending_dels = 0
	local pending_adds = {}
	local del_anchor = 0

	local function flush()
		local n_add = #pending_adds
		local n_change = math.min(pending_dels, n_add)
		for i = 1, n_change do
			table.insert(signs, { line = pending_adds[i], kind = 'change' })
		end
		for i = n_change + 1, n_add do
			table.insert(signs, { line = pending_adds[i], kind = 'add' })
		end
		if pending_dels > n_change then
			local pos = n_change > 0 and pending_adds[n_change] or math.max(1, del_anchor)
			table.insert(signs, { line = pos, kind = 'delete' })
		end
		pending_dels = 0
		pending_adds = {}
	end

	for line in output:gmatch('[^\n]+') do
		local na = line:match('^@@ %-%d+,?%d* %+(%d+),?%d* @@')
		if na then
			flush()
			new_line = tonumber(na)
			del_anchor = new_line - 1
		elseif line:sub(1, 1) == ' ' then
			flush()
			del_anchor = new_line
			new_line = new_line + 1
		elseif line:sub(1, 1) == '+' then
			table.insert(pending_adds, new_line)
			new_line = new_line + 1
		elseif line:sub(1, 1) == '-' then
			pending_dels = pending_dels + 1
		end
	end
	flush()

	return signs
end

local function update(buf)
	local path = vim.api.nvim_buf_get_name(buf)
	if path == '' or vim.bo[buf].buftype ~= '' then return end

	local dir = vim.fn.fnamemodify(path, ':h')
	vim.system(
		{ 'git', '-C', dir, 'diff', '--unified=0', 'HEAD', '--', path },
		{ text = true },
		function(result)
			if result.code ~= 0 then return end
			local diff_signs = parse_diff(result.stdout or '')
			vim.schedule(function()
				if not vim.api.nvim_buf_is_valid(buf) then return end
				vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
				for _, s in ipairs(diff_signs) do
					pcall(vim.api.nvim_buf_set_extmark, buf, ns, s.line - 1, 0, {
						sign_text = '●',
						sign_hl_group = hl_map[s.kind],
					})
				end
			end)
		end
	)
end

return {
	update = update,
}
