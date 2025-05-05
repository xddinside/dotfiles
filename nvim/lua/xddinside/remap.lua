vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<leader>pt', ':Telescope smart_open<CR>', { silent = true })
vim.api.nvim_set_keymap("n", "<leader>n", ":Neotree toggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>rn", ":IncRename ")
-- noice: to move to the message, press <C-w>w : jump to notification popup, builtin neovim

-- stop saving to neovim clipboard with x and s (used to cut a char)
vim.keymap.set({"n", "x"}, "x", '"_x', {silent = true})
vim.keymap.set({"n", "x"}, "s", '"_s', {silent = true})

vim.keymap.set('n', '<leader>md', ':MarkdownPreviewToggle<CR>')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzz")

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Useful keymaps for sourcing, quitting and writing the file
vim.keymap.set("n", "<leader>s", ":source<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>Q", ":qa<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- exit out of insert mode with jj
vim.keymap.set("i", "jj", "")

-- save and run js/ts code
vim.api.nvim_set_keymap('n', '<leader>r', ':w<CR>:!node %<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>t", function()
    vim.cmd("w") -- Save the file
    local ts_file = vim.fn.expand("%") -- Get the current file (e.g., src/index.ts)
    local filename = vim.fn.expand("%:t:r") -- Get filename without extension (e.g., 'index' from 'index.ts')
    vim.cmd("!tsc && node dist/" .. filename .. ".js") -- Compile and run
    -- vim.cmd("!node dist/" .. filename .. ".js") -- Run the compiled JS file
end, { desc = "Compile and run TypeScript", silent = true })


-- use emmet for expanding boilerplate, adding for html specifically
vim.g.user_emmet_leader_key = '<C-e>'

