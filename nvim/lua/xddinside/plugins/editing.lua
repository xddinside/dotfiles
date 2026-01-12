return {
  {
    "m4xshen/autoclose.nvim",
    event = "InsertEnter",
    config = function()
      require("autoclose").setup({
        options = {
          disable_when_touch = true,
          disabled_filetypes = { "text", "markdown" },
        },
      })
    end,
  },

  {
    "mattn/emmet-vim",
    event = "InsertEnter",
  },
}
