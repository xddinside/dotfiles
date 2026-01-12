if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h16"
  vim.g.neovide_text_gamma = 0.0
  vim.g.neovide_text_contrast = 0.5

  vim.g.neovide_opacity = 0.75
  vim.g.neovide_normal_opacity = 1

  vim.g.neovide_scroll_animation_length = 0.15
  vim.g.neovide_refresh_rate = 120

  vim.g.neovide_fullscreen = true

  vim.g.neovide_floating_blur_amount_y = 5.0
  vim.g.neovide_floating_blur_amount_x = 5.0

  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0

  vim.g.neovide_hide_mouse_when_typing = true

  -- Cursor Animations
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_trail_size = 0

  -- Clipboard keymaps
  vim.api.nvim_set_keymap("", "<C-S-V>", '"+gP', { noremap = true, silent = true })
  vim.api.nvim_set_keymap("!", "<C-S-V>", "<C-R>+", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("t", "<C-S-V>", '"+gP', { noremap = true, silent = true })
  vim.api.nvim_set_keymap("v", "<C-S-V>", '"+gP', { noremap = true, silent = true })
end
