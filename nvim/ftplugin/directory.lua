-- The builtin directory explorer (:help dir) is read-only by design.
-- These restore the netrw file-management keys it doesn't provide.
local function reload()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>(nvim-dir-reload)", true, true, true), "x", false)
end

local function create_file()
  local name = vim.fn.input("New file: ")
  if name == "" then return end
  local path = vim.fs.joinpath(vim.api.nvim_buf_get_name(0), name)
  if vim.fn.filereadable(path) == 1 or vim.fn.isdirectory(path) == 1 then
    vim.notify(name .. " already exists", vim.log.levels.WARN)
    return
  end
  vim.fn.writefile({}, path)
  reload()
end

local function create_dir()
  local name = vim.fn.input("New directory: ")
  if name == "" then return end
  vim.fn.mkdir(vim.fs.joinpath(vim.api.nvim_buf_get_name(0), name), "p")
  reload()
end

local function delete_entry()
  local entry = vim.api.nvim_get_current_line()
  if entry == "" then return end
  local path = vim.fs.joinpath(vim.api.nvim_buf_get_name(0), entry)
  if vim.fn.confirm("Delete " .. path .. "?", "&Yes\n&No", 2) ~= 1 then return end
  if vim.fn.delete(path, "rf") ~= 0 then
    vim.notify("Failed to delete " .. path, vim.log.levels.ERROR)
    return
  end
  reload()
end

local function rename_entry()
  local entry = vim.api.nvim_get_current_line():gsub("/$", "")
  if entry == "" then return end
  local dir = vim.api.nvim_buf_get_name(0)
  local full_path = vim.fs.joinpath(dir, entry)
  local new_name = vim.fn.input("Rename to: ", full_path)
  if new_name == "" or new_name == full_path then return end
  local new_path = vim.fn.isabsolutepath(new_name) == 1 and new_name or vim.fs.joinpath(dir, new_name)
  if vim.fn.filereadable(new_path) == 1 or vim.fn.isdirectory(new_path) == 1 then
    vim.notify(new_name .. " already exists", vim.log.levels.WARN)
    return
  end
  if vim.fn.rename(vim.fs.joinpath(dir, entry), new_path) ~= 0 then
    vim.notify("Failed to rename " .. entry, vim.log.levels.ERROR)
    return
  end
  reload()
end

vim.keymap.set("n", "%", create_file, { buffer = true, desc = "Create file" })
vim.keymap.set("n", "d", create_dir, { buffer = true, desc = "Create directory" })
vim.keymap.set("n", "D", delete_entry, { buffer = true, desc = "Delete entry under cursor" })
vim.keymap.set("n", "r", rename_entry, { buffer = true, desc = "Rename entry under cursor" })
