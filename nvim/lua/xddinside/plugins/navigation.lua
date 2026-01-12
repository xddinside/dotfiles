return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>pf", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<C-p>", "<cmd>Telescope git_files<CR>", desc = "Git files" },
      {
        "<leader>ps",
        function()
          require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
        end,
        desc = "Grep string",
      },
    },
  },

  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    dependencies = {
      "kkharji/sqlite.lua",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>pt", "<cmd>Telescope smart_open<CR>", desc = "Smart open", silent = true },
    },
    config = function()
      require("telescope").load_extension("smart_open")
    end,
  },

  {
    "kkharji/sqlite.lua",
    lazy = true,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    },
    keys = {
      { "<leader>n", "<cmd>Neotree toggle<CR>", desc = "Toggle Neotree" },
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_by_name = {
              "node_modules",
              ".git",
              ".next",
            },
            never_show = {
              "node_modules",
              ".git",
              ".next",
            },
          },
          follow_current_file = { enabled = true },
        },
        window = {
          position = "left",
          width = 30,
          mappings = {
            ["<CR>"] = "open",
            ["<C-v>"] = "open_vsplit",
            ["<C-x>"] = "open_split",
            ["t"] = "open_tabnew",
            ["h"] = "close_node",
            ["l"] = "open",
            ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
            ["F"] = "focus_preview",
            ["<C-b>"] = { "scroll_preview", config = { direction = 10 } },
            ["<C-f>"] = { "scroll_preview", config = { direction = -10 } },
          },
        },
        buffers = {
          follow_current_file = { enabled = true },
        },
        git_status = {
          symbols = {
            added = "✚",
            modified = "",
            deleted = "✖",
          },
        },
      })
    end,
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>a",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon add file",
      },
      {
        "<leader>h",
        function()
          require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
        end,
        desc = "Harpoon menu",
      },
      {
        "<C-j>",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "Harpoon file 1",
      },
      {
        "<C-k>",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "Harpoon file 2",
      },
      {
        "<C-l>",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "Harpoon file 3",
      },
      {
        "<C-;>",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "Harpoon file 4",
      },
      {
        "<C-S-J>",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "Harpoon prev",
      },
      {
        "<C-S-K>",
        function()
          require("harpoon"):list():next()
        end,
        desc = "Harpoon next",
      },
    },
    config = function()
      require("harpoon"):setup()
    end,
  },

  {
    "Rics-Dev/project-explorer.nvim",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      -- Set up keymap
      vim.keymap.set("n", "<leader>fp", "<cmd>ProjectExplorer<CR>", { desc = "Project Explorer" })

      -- Setup plugin
      require("project_explorer").setup({
        paths = {
          "~/dev/",
          "~/dotfiles",
          "~/notes/",
          "~/notes/life/",
        },
        newProjectPath = "~/dev/",
        file_explorer = function(dir)
          pcall(vim.cmd, "Neotree close")
          vim.cmd("Neotree " .. dir)
        end,
      })
    end,
  },
}
