local colors = {
	normal = {fg = 'black',   bg = '#8fbfdc', ctermfg = 'black', ctermbg = 'cyan'   },
	insert = {fg = 'black',   bg = '#d7afff', ctermfg = 'black', ctermbg = 'magenta'},
	user1  = {fg = '#adadad', bg = '#4e4e4e', ctermfg = 7,       ctermbg = 239      },
	user2  = {fg = '#adadad', bg = '#303030', ctermfg = 7,       ctermbg = 236      },
	user3  = {fg = '#4e4e4e', bg = '#4e4e4e', ctermfg = 239,     ctermbg = 239      },
}

local function hlCallback(name, color)
	return function() vim.api.nvim_set_hl(0, name, color) end
end

local function startsWith(str, substring)
	return (str:sub(1,#substring) == substring)
end

_G.modeName = function()
	local vmode = vim.api.nvim_get_mode()['mode']
	if     startsWith(vmode, 'n')  then return 'Normal'
	elseif startsWith(vmode, 'v')  then return 'Visual'
	elseif startsWith(vmode, 'V')  then return 'V·Line'
	elseif startsWith(vmode, '') then return 'V·Block'
	elseif startsWith(vmode, 's')  then return 'Select'
	elseif startsWith(vmode, 'S')  then return 'S·Line'
	elseif startsWith(vmode, '') then return 'S·Block'
	elseif startsWith(vmode, 'i')  then return 'Insert'
	elseif startsWith(vmode, 'R')  then return 'Replace'
	elseif startsWith(vmode, 'c')  then return 'Command'
	elseif startsWith(vmode, 'r')  then return 'Confirm'
	elseif startsWith(vmode, 't')  then return 'Terminal'
	elseif vmode == '!'            then return 'Shell'
	else                                return '~_~'
	end
end

vim.go.statusline = "%0* ● %1* %<%F:%l:%c %2*%=%y%3*│%1* [%3p%%] %0* %{%v:lua.modeName()%} "
vim.api.nvim_create_autocmd({"InsertEnter"}, {callback = hlCallback('statusline', colors.insert)})
vim.api.nvim_create_autocmd({"InsertLeave"}, {callback = hlCallback('statusline', colors.normal)})
vim.api.nvim_set_hl(0, 'statusline', colors.normal)
vim.api.nvim_set_hl(0, 'User1', colors.user1)
vim.api.nvim_set_hl(0, 'User2', colors.user2)
vim.api.nvim_set_hl(0, 'User3', colors.user3)
