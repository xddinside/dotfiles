local is_neovide = vim.g.neovide or false

require("zen-mode").setup {
    window = {
        width = 150,
        options = {
            number = true,
            relativenumber = true,
        }
    },
}

-- Zenmode keymap
vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").toggle()
    vim.wo.wrap = false
    if vim.g.neovide == false then
        ColorMyPencils()
    end
end)

-- Start zenmode on startup if not in neovide
if is_neovide == false then
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        require("zen-mode").toggle()
        vim.wo.wrap = false
        if vim.g.neovide == false then
            ColorMyPencils()
        end
      end,
    })
end
