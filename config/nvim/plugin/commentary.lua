-- lua port of vim-commentary
local function esc(str)
	return (str:gsub('[%(%)%.%%%+%-%*%?%[%]%^%$]', '%%%1'))
end

local function get_comment_parts()
	local cs = vim.bo.commentstring
	if not cs or cs == '' then return nil, nil end
	local left, right = cs:match('^(.-)%s*%%s%s*(.-)$')
	if not left then return nil, nil end
	return vim.trim(left), vim.trim(right)
end

local function is_commented(line, left, right)
	local content = line:match('^%s*(.-)%s*$') or ''
	if right ~= '' then
		return content:find('^' .. esc(left) .. '.-' .. esc(right) .. '$') ~= nil
	else
		return content:find('^' .. esc(left)) ~= nil
	end
end

local function toggle_comment(start_line, end_line)
	local left, right = get_comment_parts()
	if not left or left == '' then return end
	right = right or ''

	local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

	local all_commented = true
	for _, line in ipairs(lines) do
		if line:match('%S') and not is_commented(line, left, right) then
			all_commented = false
			break
		end
	end

	local new_lines = {}
	for _, line in ipairs(lines) do
		if not line:match('%S') then
			table.insert(new_lines, line)
		elseif all_commented then
			local new_line
			if right ~= '' then
				new_line = line:gsub('^(%s*)' .. esc(left) .. '%s?(.-)%s?' .. esc(right) .. '%s*$', '%1%2')
			else
				new_line = line:gsub('^(%s*)' .. esc(left) .. '%s?', '%1')
			end
			table.insert(new_lines, new_line)
		else
			local indent, content = line:match('^(%s*)(.*)')
			if right ~= '' then
				table.insert(new_lines, indent .. left .. ' ' .. content .. ' ' .. right)
			else
				table.insert(new_lines, indent .. left .. ' ' .. content)
			end
		end
	end

	vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, new_lines)
end

vim.keymap.set('x', 'gc', function()
	toggle_comment(vim.fn.line("'<"), vim.fn.line("'>"))
end, { desc = 'Toggle comment on selection' })
