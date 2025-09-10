local is_neovide = vim.g.neovide or false

if is_neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h16"
  vim.g.neovide_text_gamma = 0.0 -- default
  vim.g.neovide_text_contrast = 0.5 -- default

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
  vim.g.neovide_cursor_animation_length = 0 -- disable animation entirely

  -- vim.g.neovide_cursor_short_animation_length = 0 -- no “typing” micro-movement

  vim.g.neovide_cursor_trail_size = 0 -- remove smear/trailing

  -- vim.g.neovide_cursor_animate_in_insert_mode = false -- jump instantly in insert mode

  -- vim.g.neovide_cursor_animate_command_line = false -- no hop to cmdline

  -- vim.g.neovide_cursor_vfx_mode = "" -- ensure no particle effects

  -- vim.g.neovide_scroll_animation_length = 0 -- remove scroll animation 

  -- vim.g.neovide_position_animation_length = 0  -- remove position animation


  --vim.keymap.set('n', '<leader>P', '"+gP', { noremap = true, silent = true}) -- Paste normal mode
  --vim.keymap.set('v', '<leader>P', '"+gP', { noremap = true, silent = true}) -- Paste visual mode
  --vim.keymap.set('c', '<leader>P', '<C-R>+', { noremap = true, silent = true}) -- Paste command mode
  --vim.keymap.set('i', '<C-S-V>', '<ESC>"+gPli', { noremap = true, silent = true}) -- Paste insert mode

  -- Allow clipboard copy paste in neovim
  vim.api.nvim_set_keymap('',  '<C-S-V>', '"+gP', { noremap = true, silent = true})
  vim.api.nvim_set_keymap('!', '<C-S-V>', '<C-R>+', { noremap = true, silent = true})
  vim.api.nvim_set_keymap('t', '<C-S-V>', '"+gP', { noremap = true, silent = true})
  vim.api.nvim_set_keymap('v', '<C-S-V>', '"+gP', { noremap = true, silent = true})
end
