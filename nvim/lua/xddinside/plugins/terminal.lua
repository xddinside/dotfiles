-- Helper function for named floaterm toggling
local function toggle_named_floaterm(name, cmd, opts)
  opts = opts or {}
  local width = opts.width or 0.8
  local height = opts.height or 0.8
  local cwd = opts.cwd or nil

  local term_exists = vim.fn["floaterm#terminal#get_bufnr"](name) ~= -1

  if term_exists then
    vim.cmd("FloatermToggle " .. name)
  else
    vim.g.floaterm_width = width
    vim.g.floaterm_height = height

    local command = "FloatermNew --name=" .. name
    if cwd then
      command = command .. " --cwd=" .. cwd
    end
    if cmd then
      command = command .. " " .. cmd
    end
    vim.cmd(command)

    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
  end
end

return {
  {
    "voldikss/vim-floaterm",
    keys = {
      { "<leader>ft", "<cmd>FloatermToggle<CR>", desc = "Toggle floaterm" },
      { "<C-Space>", [[<C-\><C-n>:FloatermToggle<CR>]], mode = "t", desc = "Toggle floaterm from terminal" },
      { "<leader>go", "<cmd>FloatermNew --autoclose=0 go run %<CR>", desc = "Go run current file" },
      {
        "<leader>gr",
        function()
          local current_file_dir = vim.fn.expand("%:p:h")
          vim.g.floaterm_width = 0.8
          vim.g.floaterm_height = 0.8
          vim.cmd("FloatermNew --autoclose=0 --cwd=" .. current_file_dir .. " go run .")
        end,
        desc = "Go run current directory",
      },
      {
        "<leader>f1",
        function()
          toggle_named_floaterm("term1", nil, { width = 0.65, height = 0.6 })
        end,
        desc = "Toggle term1",
      },
      {
        "<leader>f2",
        function()
          toggle_named_floaterm("term2", nil, { width = 0.85, height = 0.80 })
        end,
        desc = "Toggle term2",
      },
      {
        "<leader>f3",
        function()
          toggle_named_floaterm("term3", "lazygit", { width = 0.99, height = 0.99, cwd = vim.fn.expand("%:p:h") })
        end,
        desc = "Toggle lazygit",
      },
    },
    config = function()
      -- Detect which terminal was opened
      vim.api.nvim_create_autocmd("User", {
        pattern = "FloatermOpen",
        callback = function()
          local name = vim.b.floaterm_name
          if name == "term3" then
            -- lazygit terminal: gold border
            vim.cmd([[
              highlight Floaterm guibg=NONE guifg=#c0caf5
              highlight FloatermBorder guibg=NONE guifg=#e0af68
            ]])
          else
            -- all other terminals: blue border
            vim.cmd([[
              highlight Floaterm guibg=NONE guifg=#c0caf5
              highlight FloatermBorder guibg=NONE guifg=#7aa2f7
            ]])
          end
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "FloatermHide",
        callback = function()
          vim.cmd([[
            highlight Floaterm guibg=NONE guifg=#c0caf5
            highlight FloatermBorder guibg=NONE guifg=#7aa2f7
          ]])
        end,
      })
    end,
  },
}
