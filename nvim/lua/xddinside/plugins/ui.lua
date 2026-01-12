return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- Configuration handled by theme-switcher
    end,
  },

  {
    "akinsho/bufferline.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
      { "<C-S-W>", "<Cmd>bdelete!<CR>", desc = "Delete buffer" },
      { "<leader>1", "<cmd>lua require('bufferline').go_to_buffer(1)<CR>", desc = "Go to Buffer 1" },
      { "<leader>2", "<cmd>lua require('bufferline').go_to_buffer(2)<CR>", desc = "Go to Buffer 2" },
      { "<leader>3", "<cmd>lua require('bufferline').go_to_buffer(3)<CR>", desc = "Go to Buffer 3" },
      { "<leader>4", "<cmd>lua require('bufferline').go_to_buffer(4)<CR>", desc = "Go to Buffer 4" },
      { "<leader>5", "<cmd>lua require('bufferline').go_to_buffer(5)<CR>", desc = "Go to Buffer 5" },
      { "<leader>6", "<cmd>lua require('bufferline').go_to_buffer(6)<CR>", desc = "Go to Buffer 6" },
      { "<leader>7", "<cmd>lua require('bufferline').go_to_buffer(7)<CR>", desc = "Go to Buffer 7" },
      { "<leader>8", "<cmd>lua require('bufferline').go_to_buffer(8)<CR>", desc = "Go to Buffer 8" },
      { "<leader>9", "<cmd>lua require('bufferline').go_to_buffer(9)<CR>", desc = "Go to Buffer 9" },
    },
    config = function()
      local bufferline = require("bufferline")

      require("bufferline").setup({
        options = {
          mode = "buffers",
          style_preset = bufferline.style_preset.minimal,
          themable = true,
          numbers = "ordinal",
          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          left_mouse_command = "buffer %d",
          middle_mouse_command = nil,
          buffer_close_icon = "✗",
          close_icon = "",
          path_components = 1,
          modified_icon = "●",
          left_trunc_marker = "",
          right_trunc_marker = "",
          max_name_length = 30,
          max_prefix_length = 30,
          tab_size = 18,
          diagnostics = false,
          diagnostics_update_in_insert = false,
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              highlight = "Directory",
              separator = true,
            },
          },
          color_icons = true,
          show_buffer_icons = false,
          show_buffer_close_icons = false,
          show_close_icon = false,
          persist_buffer_sort = true,
          separator_style = "thin",
          enforce_regular_tabs = false,
          always_show_bufferline = true,
          show_tab_indicators = false,
          hover = {
            enabled = true,
            delay = 200,
            reveal = { "close" },
          },
          indicator = {
            style = "none",
          },
          icon_pinned = "󰐃",
          minimum_padding = 1,
          maximum_padding = 5,
          maximum_length = 15,
          sort_by = "insert_at_end",
        },
        -- highlights will be set dynamically by theme-switcher
      })
    end,
  },

  {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      local status_ok, alpha = pcall(require, "alpha")
      if not status_ok then
        return
      end

      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        [[                                                    ]],
        [[                                                    ]],
        [[                                                    ]],
        [[                                                    ]],
        [[                                                    ]],
        [[                                                    ]],
        [[                                                    ]],
        [[                                                    ]],
        [[                                                    ]],
        [[                                                    ]],
        [[                                                    ]],
        [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
        [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
        [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
        [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
        [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
        [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
        [[                                                    ]],
        [[                                                    ]],
        [[                                                    ]],
      }

      dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "  Find file", "<cmd>lua require('telescope.builtin').find_files()<CR>"),
        dashboard.button("r", "  Recent files", "<cmd>lua require('telescope.builtin').oldfiles()<CR>"),
        dashboard.button("t", "  Find text", "<cmd>lua require('telescope.builtin').live_grep()<CR>"),
        dashboard.button("p", "  Find project", ":ProjectExplorer<CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }

      alpha.setup(dashboard.opts)
    end,
  },

  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      require("notify").setup({
        timeout = 2000,
        stages = "static",
      })
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
  },

  {
    "nvimdev/indentmini.nvim",
    lazy = false,
    config = function()
      vim.cmd.highlight("IndentLine guifg=#1C1E26")
      vim.cmd.highlight("IndentLineCurrent guifg=#7F8490")
      require("indentmini").setup({
        exclude = { "markdown" },
        minlevel = 2,
        only_current = true,
      })
    end,
  },
}
