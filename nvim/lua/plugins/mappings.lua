-- ~/.config/nvim/lua/plugins/mappings.lua



-- 2) Floating window runner for Python
local function run_python_script()
  vim.cmd('write')  -- save current file
  local path = vim.fn.expand("%:p")
  if vim.fn.filereadable(path) == 0 or not path:match("%.py$") then
    return print("Not a Python file!")
  end

  -- calculate window size/pos
  local h = math.ceil(vim.o.lines * 0.3)
  local w = math.ceil(vim.o.columns * 0.5)
  local r = math.ceil((vim.o.lines - h) * 0.5)
  local c = math.ceil((vim.o.columns - w) * 0.5)

  local win_opts = {
    border   = "rounded",
    relative = "editor",
    style    = "minimal",
    width    = w,
    height   = h,
    row      = r,
    col      = c,
  }

  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, win_opts)

  -- close keys
  local km_opts = { silent = true, buffer = buf }
  vim.keymap.set('n', 'q',   function() vim.api.nvim_win_close(win, true) end, km_opts)
  vim.keymap.set('n', '<Esc>', function() vim.api.nvim_win_close(win, true) end, km_opts)

  vim.fn.termopen('python3 "' .. path .. '"')
end

-- 3) Wire it up
local function setup_commands()
  vim.api.nvim_create_user_command("RunPythonScript", run_python_script, { nargs = 0 })
  vim.keymap.set('n', '<F5>', ':RunPythonScript<CR>',
                 { noremap = true, silent = true, desc = "Run Python Script in Floating Terminal" })
end

-- fire it all off
setup_commands()

-- return an empty table so lazy.nvim sees a “valid spec” and doesn’t error
return {}

