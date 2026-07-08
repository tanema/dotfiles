-- poor lua port of vim-surround with only the parts that I use, no spaces added
-- using different brackets, I rely on formatters to do that for me
local surround_pairs = {
	['('] = { '(', ')' },
	[')'] = { '(', ')' },
	['['] = { '[', ']' },
	[']'] = { '[', ']' },
	['{'] = { '{', '}' },
	['}'] = { '{', '}' },
	['"'] = { '"', '"' },
	["'"] = { "'", "'" },
	['`'] = { '`', '`' },
}

local quote_chars = { ['"'] = true, ["'"] = true, ['`'] = true }

local function wrap_pair(char)
	local p = surround_pairs[char]
	if p then
		return p[1], p[2]
	end
	return char, char
end

local function find_bracket_surrounding(char)
	local p = surround_pairs[char]
	if not p then return nil end
	local open_pat = '\\V' .. p[1]
	local close_pat = '\\V' .. p[2]
	local saved = vim.fn.getpos('.')
	local found = vim.fn.searchpairpos(open_pat, '', close_pat, 'bW')
	if found[1] == 0 then
		vim.fn.setpos('.', saved)
		return nil
	end
	local open_pos = { found[1], found[2] }
	vim.cmd('normal! %')
	local close_pos = { vim.fn.line('.'), vim.fn.col('.') }
	vim.fn.setpos('.', saved)
	if close_pos[1] == open_pos[1] and close_pos[2] == open_pos[2] then
		return nil
	end
	return open_pos, close_pos
end

local function find_quote_surrounding(char)
	local row = vim.fn.line('.')
	local col = vim.fn.col('.') -- 1-indexed
	local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]
	local sc, ec
	for i = col - 1, 1, -1 do
		if line:sub(i, i) == char then
			sc = i; break
		end
	end
	if not sc then return nil end
	for i = col + 1, #line do
		if line:sub(i, i) == char then
			ec = i; break
		end
	end
	if not ec then return nil end
	return { row, sc }, { row, ec }
end

local function find_surrounding(char)
	if not surround_pairs[char] then return nil end
	if quote_chars[char] then
		return find_quote_surrounding(char)
	end
	return find_bracket_surrounding(char)
end

local function replace_char(row, col, str)
	vim.api.nvim_buf_set_text(0, row - 1, col - 1, row - 1, col, { str })
end

local function delete_surround()
	local char = vim.fn.getcharstr()
	local sp, ep = find_surrounding(char)
	if not sp or not ep then return end
	replace_char(ep[1], ep[2], '')
	replace_char(sp[1], sp[2], '')
end

local function change_surround()
	local old = vim.fn.getcharstr()
	local new = vim.fn.getcharstr()
	local sp, ep = find_surrounding(old)
	if not sp or not ep then return end
	local open, close = wrap_pair(new)
	replace_char(ep[1], ep[2], close)
	replace_char(sp[1], sp[2], open)
end

local function surround_visual()
	local char = vim.fn.getcharstr()
	local open, close = wrap_pair(char)
	local sr = vim.fn.line("'<") - 1
	local sc = vim.fn.col("'<") - 1
	local er = vim.fn.line("'>") - 1
	local ec = vim.fn.col("'>") - 1
	local er_line = vim.api.nvim_buf_get_lines(0, er, er + 1, false)[1] or ''
	ec = math.min(ec, #er_line - 1)
	vim.api.nvim_buf_set_text(0, er, ec + 1, er, ec + 1, { close })
	vim.api.nvim_buf_set_text(0, sr, sc, sr, sc, { open })
end

return {
	delete_surround = delete_surround,
	change_surround = change_surround,
	surround_visual = surround_visual,
}
