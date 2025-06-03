require('nvim-ts-autotag').setup({
  setup = {
    -- your configuration here
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false,
    per_filetype = {
      html = {
        enable_close = true,
      },
    },
    aliases = {
      -- ["your language here"] = "html",
    }
  }
})
