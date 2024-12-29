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
    ColorMyPencils()
end)

-- Start zenmode on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("zen-mode").toggle()
    vim.wo.wrap = false
    ColorMyPencils()
  end,
})
