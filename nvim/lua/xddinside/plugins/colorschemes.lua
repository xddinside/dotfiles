return {
  {
    "sainnhe/sonokai",
    priority = 1000,
    lazy = false,
    config = function()
      vim.g.sonokai_transparent_background = "1"
      vim.g.sonokai_enable_italic = "1"
      vim.g.sonokai_style = "andromeda"
    end,
  },

  {
    "datsfilipe/vesper.nvim",
    lazy = false,
    config = function()
      require("vesper").setup({
        transparent = true,
        italics = {
          comments = true,
          keywords = true,
          functions = true,
          strings = true,
          variables = true,
        },
        overrides = {},
        palette_overrides = {},
      })
    end,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    config = function()
      require("rose-pine").setup({
        disable_background = true,
      })
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
      })
    end,
  },

  {
    "shaunsingh/nord.nvim",
    lazy = false,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = true
      vim.g.nord_italic = false
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false
    end,
  },

  {
    "Shobhit-Nagpal/chai.nvim",
    lazy = false,
    dependencies = { "tjdevries/colorbuddy.nvim" },
    config = function()
      require("chai").setup({
        transparent_background = true,
        comment_italics = true,
      })
    end,
  },
}
