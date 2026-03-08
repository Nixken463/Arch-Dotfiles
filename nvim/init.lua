-- Tab settings
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.relativenumber = true
vim.opt.number = true
require("config.lazy")
require('plugins.mappings')

-- Persistent undo
-- Define the path and create the undo directory if it doesn't exist
local undodir_path = vim.fn.stdpath("config") .. "/undodir"
if vim.fn.isdirectory(undodir_path) == 0 then
  vim.fn.mkdir(undodir_path, "p") -- 'p' creates parent dirs if needed
end
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true          -- Enable persistent undo
vim.opt.undodir = undodir_path   -- Set the directory to store undo files (use the defined variable here)
vim.opt.undolevels = 10000       -- Maximum number of changes that can be undone
vim.opt.undoreload = 10000       -- Maximum number of lines to save for undo on reload
