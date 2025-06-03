vim.g.mapleader = " "
local set = vim.keymap.set
set("n", "<leader>pv", vim.cmd.Ex)
set('n', '<leader>pt', ':Telescope smart_open<CR>', { silent = true })
vim.api.nvim_set_keymap("n", "<leader>n", ":Neotree toggle<CR>", { noremap = true, silent = true })
set("n", "<leader>rn", ":IncRename ")
-- noice: to move to the message, press <C-w>w : jump to notification popup, built in neovim

-- stop saving to neovim clipboard with x and s (used to cut a char)
set({"n", "x"}, "x", '"_x', {silent = true})
set({"n", "x"}, "s", '"_s', {silent = true})

set("n", "<leader>gd", ":GoDoc<CR>", { noremap = true, silent = true })

set('n', '<leader>md', ':MarkdownPreviewToggle<CR>')

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzz")

set({"n", "v"}, "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])

-- Useful keymaps for sourcing, quitting and writing the file
set("n", "<leader>s", ":source<CR>")
set("n", "<leader>q", ":q<CR>")
set("n", "<leader>Q", ":qa<CR>")
set("n", "<leader>w", ":w<CR>")

-- exit out of insert mode with jj
set("i", "jj", "")

-- save and run js/ts code
vim.api.nvim_set_keymap('n', '<leader>r', ':w<CR>:!node %<CR>', { noremap = true, silent = true })

set("n", "<leader>t", function()
    vim.cmd("w") -- Save the file
    local ts_file = vim.fn.expand("%") -- Get the current file (e.g., src/index.ts)
    local filename = vim.fn.expand("%:t:r") -- Get filename without extension (e.g., 'index' from 'index.ts')
    vim.cmd("!tsc && node dist/" .. filename .. ".js") -- Compile and run
    -- vim.cmd("!node dist/" .. filename .. ".js") -- Run the compiled JS file
end, { desc = "Compile and run TypeScript", silent = true })


-- use emmet for expanding boilerplate, adding for html specifically
vim.g.user_emmet_leader_key = '<C-e>'

