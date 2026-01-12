return {
  {
    "folke/zen-mode.nvim",
    keys = {
      {
        "<leader>zz",
        function()
          require("zen-mode").toggle()
          vim.wo.wrap = false
          if vim.g.neovide == false then
            ColorMyPencils()
          end
        end,
        desc = "Toggle Zen Mode",
      },
    },
    config = function()
      require("zen-mode").setup({
        window = {
          width = 150,
          options = {
            number = true,
            relativenumber = true,
          },
        },
      })
    end,
  },
}
