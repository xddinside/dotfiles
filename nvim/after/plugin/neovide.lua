local is_neovide = vim.g.neovide or false

if is_neovide then
    vim.o.guifont = "JetBrainsMono Nerd Font:h16"
    vim.g.neovide_text_gamma = 0.0 -- default
    vim.g.neovide_text_contrast = 0.5 -- default

    vim.g.neovide_opacity = 0.75
    vim.g.neovide_normal_opacity = 1

    vim.g.neovide_scroll_animation_length = 0.15
    vim.g.neovide_refresh_rate = 120

    vim.g.neovide_fullscreen = false

    vim.g.neovide_floating_blur_amount_y = 5.0
    vim.g.neovide_floating_blur_amount_x = 5.0

    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0

    vim.g.neovide_hide_mouse_when_typing = true

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
