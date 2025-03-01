local is_neovide = vim.g.neovide or false

if is_neovide then

    vim.g.neovide_opacity = 0.9
    vim.g.transparency = 1
    vim.g.neovide_normal_opacity = 1

    vim.g.neovide_fullscreen = true

    vim.g.neovide_floating_blur_amount_y = 5.0
    vim.g.neovide_floating_blur_amount_x = 5.0

    vim.g.neovide_padding_top = 20
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 20

    vim.g.neovide_hide_mouse_when_typing = true

    vim.keymap.set('n', '<C-S-v>', '"+P') -- Paste normal mode
    vim.keymap.set('v', '<C-S-v>', '"+P') -- Paste visual mode
    vim.keymap.set('c', '<C-S-v>', '<C-R>+') -- Paste command mode
    vim.keymap.set('i', '<C-S-v>', '<ESC>l"+Pli') -- Paste insert mode

    -- Allow clipboard copy paste in neovim
    vim.api.nvim_set_keymap('', '<C-S-v>', '+p<CR>', { noremap = true, silent = true})
    vim.api.nvim_set_keymap('!', '<C-S-v>', '<C-R>+', { noremap = true, silent = true})
    vim.api.nvim_set_keymap('t', '<C-S-v>', '<C-R>+', { noremap = true, silent = true})
    vim.api.nvim_set_keymap('v', '<C-S-v>', '<C-R>+', { noremap = true, silent = true})

end
