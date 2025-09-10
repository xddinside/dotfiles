require("xddinside.remap")
require("xddinside.set")
require("xddinside.lsp-config")

-- Load saved theme with proper integrations
local theme_switcher = require('xddinside.theme-switcher')
local saved_theme = theme_switcher.load_saved_theme()
theme_switcher.apply_theme(saved_theme)

require("xddinside.packer")

-- Specify the Python 3 interpreter path
vim.g.python3_host_prog = '/usr/bin/python3'

-- Set colors for directories
vim.cmd([[highlight Directory guifg=#f9e2af]])

-- Set colors for regular files
vim.cmd([[highlight NetrwPlain guifg=#AFC6F9]])
vim.cmd([[highlight NetrwExecutable guifg=#f38ba8]])

