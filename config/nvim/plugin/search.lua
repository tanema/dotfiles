-- files to be ignored while searching
local ignoreFiles = {
  "^\\./$",
  ".DS_Store",
  ".git/",
  "*.pyc",
  "node_modules/",
  "dist/",
  "build/",
}

local function Find(opts)
  local findStr = table.concat(opts.fargs, '\\ ')
  vim.cmd('grep! "'.. findStr .. '"|cwindow|redraw!')
end

vim.api.nvim_create_user_command('Find', Find, {
  desc = "Custom find command to make things easier",
  nargs = "+",
})

if vim.fn.executable('rg') then -- Use rg over grep
  local ignores = {}
  for _, pattern in ipairs(ignoreFiles) do
    table.insert(ignores, "-g='!"..pattern.."'")
  end
  vim.opt.grepprg = "rg --vimgrep " .. table.concat(ignores, " ")
end
