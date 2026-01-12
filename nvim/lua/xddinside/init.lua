-- Suppress lspconfig deprecation warnings
local notify = vim.notify
vim.notify = function(msg, ...)
  if msg and type(msg) == "string" and msg:match("lspconfig") then
    return
  end
  notify(msg, ...)
end

-- Also suppress vim.deprecate warnings
local deprecate = vim.deprecate
vim.deprecate = function(name, alternative, version, plugin, ...)
  if plugin and plugin:match("lspconfig") then
    return
  end
  deprecate(name, alternative, version, plugin, ...)
end

require("xddinside.remap")
require("xddinside.set")
require("xddinside.neovide")
require("xddinside.lazy")

-- Specify the Python 3 interpreter path
vim.g.python3_host_prog = '/usr/bin/python3'

-- Load saved theme after plugins are loaded
vim.defer_fn(function()
  local theme_switcher = require('xddinside.theme-switcher')
  local saved_theme = theme_switcher.load_saved_theme()
  theme_switcher.apply_theme(saved_theme)
end, 0)

-- Set colors for directories
vim.cmd([[highlight Directory guifg=#f9e2af]])

-- Set colors for regular files
vim.cmd([[highlight NetrwPlain guifg=#AFC6F9]])
vim.cmd([[highlight NetrwExecutable guifg=#f38ba8]])
