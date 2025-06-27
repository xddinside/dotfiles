local is_neovide = vim.g.neovide or false

if is_neovide then
  require("neo-tree").setup({
    close_if_last_window = true, -- Close Neo-tree when it's the last open window
    popup_border_style = "rounded", -- Border style for floating windows
    enable_git_status = true, -- Show git changes
    enable_diagnostics = true, -- Show LSP diagnostics in the tree
    filesystem = {
      filtered_items = {
        visible = false, -- Show hidden files
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {
          "node_modules",
          ".git",
        },
        never_show = {
          "node_modules",
          ".git",
        },
      },
      follow_current_file = { enabled = true }, -- Auto-focus current file in the tree
    },
    window = {
      position = "left", -- Can be "right", "float", etc.
      width = 30,
      mappings = {
        ["<CR>"] = "open", -- Open file or directory
        ["<C-v>"] = "open_vsplit", -- Open in vertical split
        ["<C-x>"] = "open_split", -- Open in horizontal split
        ["t"] = "open_tabnew", -- Open in new tab
        ["h"] = "close_node", -- Collapse folder
        ["l"] = "open", -- Expand folder or open file
        ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
        ["F"] = "focus_preview",
        ["<C-b>"] = { "scroll_preview", config = {direction = 10} },
        ["<C-f>"] = { "scroll_preview", config = {direction = -10} },

      },
    },
    buffers = {
      follow_current_file = { enabled = true }
    },
    git_status = {
      symbols = {
        added = "✚",
        modified = "",
        deleted = "✖"
      }
    },
  })
end
