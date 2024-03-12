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

vim.api.nvim_create_user_command('Find', 'grep! <args>|cwindow|redraw!', { nargs = "+" })
if vim.fn.executable('rg') then -- Use ag over grep
  local agIgnores = {}
  for _, pattern in ipairs(ignoreFiles) do
    table.insert(agIgnores, "-g='!"..pattern.."'")
  end
  vim.opt.grepprg = "rg --vimgrep " .. table.concat(agIgnores, " ")
end
