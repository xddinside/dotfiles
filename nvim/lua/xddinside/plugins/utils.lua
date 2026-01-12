return {
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
    },
  },

  {
    "Hashino/doing.nvim",
    keys = {
      { "<leader>da", function() require("doing").add() end, desc = "[D]oing: [A]dd" },
      { "<leader>de", function() require("doing").edit() end, desc = "[D]oing: [E]dit" },
      { "<leader>dn", function() require("doing").done() end, desc = "[D]oing: Do[n]e" },
      { "<leader>dt", function() require("doing").toggle() end, desc = "[D]oing: [T]oggle" },
      {
        "<leader>ds",
        function()
          vim.notify(require("doing").status(true), vim.log.levels.INFO, { title = "Doing:", icon = "" })
        end,
        desc = "[D]oing: [S]tatus",
      },
    },
    config = function()
      require("doing").setup({
        message_timeout = 2000,
        doing_prefix = "Doing: ",
        ignored_buffers = { "neo-tree" },
        show_remaining = true,
        show_messages = true,
        edit_win_config = {
          width = 50,
          height = 15,
          border = "rounded",
        },
        winbar = { enabled = false },
        store = {
          file_path = "~/.tasks",
        },
      })

      -- Custom float colors
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#000000", fg = "#2D303E" })
    end,
  },

  {
    "ThePrimeagen/vim-be-good",
    cmd = "VimBeGood",
  },

  {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = function()
      require("colortils").setup()
    end,
  },

  {
    "fredrikaverpil/godoc.nvim",
    cmd = "GoDoc",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    build = "go install github.com/lotusirous/gostdsym/stdsym@latest",
    keys = {
      { "<leader>gd", "<cmd>GoDoc<CR>", desc = "GoDoc" },
    },
    config = function()
      require("godoc").setup({
        window = {
          type = "vsplit",
        },
        picker = {
          type = "telescope",
          telescope = {},
        },
      })
    end,
  },
}
