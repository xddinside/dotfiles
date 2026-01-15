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
      { "<leader>da", function() require("doing").add() end,    desc = "[D]oing: [A]dd" },
      { "<leader>de", function() require("doing").edit() end,   desc = "[D]oing: [E]dit" },
      { "<leader>dn", function() require("doing").done() end,   desc = "[D]oing: Do[n]e" },
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

  -- NOTE: 99 plugin pinned to commit 91ea4cf due to local patches in
  -- ~/.local/share/nvim/lazy/99/ (languages option support, JS/TSX modules, queries).
  -- Unpinning will overwrite patches. See: https://github.com/ThePrimeagen/99/issues/XXX
  {
    "ThePrimeagen/99",
    commit = "91ea4cfd4a46d756152e9470abe495f4b178e818",
    config = function()
      local _99 = require("99")
      local cwd = vim.uv.cwd()
      local basename = vim.fs.basename(cwd)

      _99.setup({
        model = "google/gemini-3-flash-preview",
        languages = { "lua", "typescript", "typescriptreact", "javascript", "go" },
        display_errors = true,
        logger = {
          level = _99.DEBUG,
          path = "/tmp/" .. basename .. ".99.debug",
          print_on_error = true,
        },
        md_files = {
          "AGENT.md",
        },
      })

      vim.keymap.set("n", "<leader>9i", function()
        _99.info()
      end, { desc = "99: Show info" })

      vim.keymap.set("n", "<leader>9f", function()
        _99.fill_in_function()
      end, { desc = "99: Fill in function" })

      vim.keymap.set("v", "<leader>9v", function()
        _99.visual()
      end, { desc = "99: Visual selection" })

      vim.keymap.set("v", "<leader>9s", function()
        _99.stop_all_requests()
      end, { desc = "99: Stop requests" })
    end,
  },
}
