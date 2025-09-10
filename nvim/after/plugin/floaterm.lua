vim.keymap.set("n", "<leader>ft", ":FloatermToggle<CR>")
vim.keymap.set('t', '<C-Space>', [[<C-\><C-n>:FloatermToggle<CR>]], { noremap = true, silent = true })

local function toggle_named_floaterm(name, cmd, opts)
  opts = opts or {}
  local width  = opts.width  or 0.8
  local height = opts.height or 0.8
  local cwd    = opts.cwd    or nil

  -- Check if the terminal exists
  local term_exists = vim.fn["floaterm#terminal#get_bufnr"](name) ~= -1

  if term_exists then
    vim.cmd("FloatermToggle " .. name)
  else
    -- Set custom size for this terminal
    vim.g.floaterm_width  = width
    vim.g.floaterm_height = height

    -- Launch with name and optional command
    local command = "FloatermNew --name=" .. name
    if cwd then
      command = command .. " --cwd=" .. cwd
    end
    if cmd then
      command = command .. " " .. cmd
    end
    vim.cmd(command)

    -- Reset to default size for other terminals
    vim.g.floaterm_width  = 0.8
    vim.g.floaterm_height = 0.8
  end
end

-- Run go run in a new terminal
vim.keymap.set('n', '<leader>go', ':FloatermNew --autoclose=0 go run %<CR>')
vim.keymap.set('n', '<leader>gr', function()
  local current_file_dir = vim.fn.expand('%:p:h')
  vim.g.floaterm_width  = 0.8
  vim.g.floaterm_height = 0.8
  vim.cmd('FloatermNew --autoclose=0 --cwd=' .. current_file_dir .. ' go run .')
end, { noremap = true, silent = true })

-- Big terminal (term1)
vim.keymap.set('n', '<leader>f1', function()
  toggle_named_floaterm("term1", nil, { width = 0.8, height = 0.8 })
end, { noremap = true, silent = true })

-- Regular terminal (term2)
vim.keymap.set('n', '<leader>f2', function()
  toggle_named_floaterm("term2", "yazi", { width = 0.90, height = 0.90 })
end, { noremap = true, silent = true })

-- Big terminal for lazygit (term3)
vim.keymap.set('n', '<leader>f3', function()
  toggle_named_floaterm("term3", "lazygit", { width = 0.99, height = 0.99, cwd = vim.fn.expand('%:p:h') })
end, { noremap = true, silent = true })

-- Floaterm colors are now handled by theme integrations
-- The autocmds are set up in the theme-integrations.lua file
