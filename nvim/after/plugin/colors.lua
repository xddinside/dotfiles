function ColorMyPencils(color)
  -- color = color or "catppuccin-mocha"
  -- color = color or "sonokai"
  color = color or "vesper"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal",{ bg = "none"})
  vim.api.nvim_set_hl(0, "NormalFloat",{ bg = "none"})

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
