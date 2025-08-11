require("xddinside.remap")
require("xddinside.set")
require("xddinside.lsp-config")
vim.cmd.colorscheme('vesper')
require("xddinside.packer")

-- Specify the Python 3 interpreter path
vim.g.python3_host_prog = '/usr/bin/python3'

-- Set colors for directories
vim.cmd([[highlight Directory guifg=#f9e2af]])

-- Set colors for regular files
vim.cmd([[highlight NetrwPlain guifg=#AFC6F9]])
vim.cmd([[highlight NetrwExecutable guifg=#f38ba8]])

