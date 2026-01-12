local theme_switcher = require('xddinside.theme-switcher')

function ColorMyPencils(color)
  -- Load saved theme or use default
  color = color or theme_switcher.load_saved_theme()
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal",{ bg = "none"})
  vim.api.nvim_set_hl(0, "NormalFloat",{ bg = "none"})

  -- Update plugin highlights for the loaded theme
  -- (Nord cursor fix is handled inside theme_switcher.apply_theme)
  theme_switcher.update_bufferline_highlights(color)
  theme_switcher.update_lualine_theme(color)

  -- Ensure transparent background on fullscreen toggle
  vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  })
end

ColorMyPencils()
