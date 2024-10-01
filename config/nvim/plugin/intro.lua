local function readLines(file)
  local lines = {}
  for line in io.lines(vim.fn.stdpath('config') .. '/' .. file) do
    lines[#lines + 1] = line
  end
  return lines
end

math.randomseed(os.time())
local intro_logo = readLines("icons/intro")
local icons = {'toast', 'sonic', 'kitty', 'dontalktome', 'keyboardcat', 'skull'}
local PLUGIN_NAME = 'customintro'
local augroup = vim.api.nvim_create_augroup(PLUGIN_NAME, {})
local introBuff = vim.api.nvim_create_buf('nobuflisted', 'unlisted')
vim.api.nvim_buf_set_name(introBuff, PLUGIN_NAME)
vim.api.nvim_set_option_value('bufhidden', 'wipe', {buf = introBuff})
vim.api.nvim_set_option_value('buftype', 'nofile', {buf = introBuff})
vim.api.nvim_set_option_value('filetype', PLUGIN_NAME, { buf = introBuff })
vim.api.nvim_set_option_value('swapfile', false, { buf = introBuff })

-- color support
local highlight_ns_id = vim.api.nvim_create_namespace(PLUGIN_NAME)
vim.api.nvim_set_hl(highlight_ns_id, 'Default', {fg = '#98c379', ctermfg='darkred'})
vim.api.nvim_set_hl_ns(highlight_ns_id)

local function genTable(i)
  local t = {}
  for _ = 1, i, 1 do table.insert(t,'') end
  return t
end

local function lpad(initial, padVal)
  local padded = {}
  for _, line in ipairs(initial) do
    table.insert(padded, string.rep(' ', padVal) .. line)
  end
  return padded
end

local function append(src, values)
  local dest = {}
  for _, val in ipairs(src) do
    table.insert(dest, val)
  end
  for _, val in ipairs(values) do
    table.insert(dest, val)
  end
  return dest
end

local function draw()
  local window = vim.fn.bufwinid(introBuff)
  local logo_width = vim.fn.strdisplaywidth(intro_logo[1])
  local icon = readLines('icons/'.. icons[math.random(#icons)])
  local icon_width = vim.fn.strdisplaywidth(icon[1])
  local icon_pad = math.floor((logo_width - icon_width) / 2)
  local logo = append(intro_logo, lpad(icon, icon_pad))
  local logo_height = #logo

  local screen_width = vim.api.nvim_win_get_width(window)
  local screen_height = vim.api.nvim_win_get_height(window) - vim.opt.cmdheight:get()
  local start_col = math.floor((screen_width - logo_width) / 2)
  local start_row = math.floor((screen_height - logo_height) / 2)
  local contents = append(genTable(start_row), lpad(logo, start_col))

  vim.api.nvim_set_option_value('modifiable', true, {buf = introBuff})
  vim.api.nvim_buf_set_lines(introBuff, 0, -1, true, {})
  vim.api.nvim_buf_set_lines(introBuff, 1, 1, true, contents)
  vim.api.nvim_set_option_value('modifiable', false, {buf = introBuff})
  vim.api.nvim_buf_set_extmark(introBuff, highlight_ns_id, 0, 0, {
    end_row = 999,
    hl_group ='Default',
    strict = false,
  })
end

local function vimEnter(payload)
  local current_buff = vim.api.nvim_get_current_buf()
  if vim.fn.isdirectory(payload.file) == 1 or vim.api.nvim_buf_get_name(current_buff) ~= '' then
    return
  end
  vim.api.nvim_set_current_buf(introBuff)
  vim.api.nvim_buf_delete(current_buff, { force = true })
  vim.opt_local.number = false          -- disable line numbers
  vim.opt_local.relativenumber = false  -- disable relative line numbers
  vim.opt_local.list = false            -- disable displaying whitespace
  vim.opt_local.fillchars = {eob = ' '} -- do not display '~' on each new line
  vim.opt_local.colorcolumn = '0'       -- disable colorcolumn
  draw()

  vim.api.nvim_create_autocmd({'WinResized', 'VimResized'}, {group = augroup, buffer = introBuff, callback = draw})
end

vim.api.nvim_create_autocmd('VimEnter', {group = augroup, once = true, callback = vimEnter})
