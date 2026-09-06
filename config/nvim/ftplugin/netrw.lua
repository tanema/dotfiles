-- Specific changes for netrw buffers. This is actually a nice minimal way of
-- adding functionality to netrw without polluting my autocmds.
local fileUtils = require("fileutils")

-- vim-vinegar type navigation
-- TODO reminder we wont need this in nvim 0.13.x
-- https://www.reddit.com/r/neovim/comments/1uh24id/new_builtin_directory_viewer/
-- https://github.com/neovim/neovim/issues/32280
-- https://github.com/neovim/neovim/pull/39723
vim.keymap.set("n", "-", fileUtils.navigateUp, { desc = "Navigate up", buffer = true })
vim.keymap.set("n", "~", ":edit ~/<CR>", { desc = "Open $HOME", buffer = true })
