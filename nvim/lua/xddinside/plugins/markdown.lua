return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("render-markdown").setup()
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = "MarkdownPreviewToggle",
    ft = "markdown",
    build = "cd app && npx --yes yarn install",
    keys = {
      { "<leader>md", "<cmd>MarkdownPreviewToggle<CR>", desc = "Markdown preview" },
    },
  },
}
