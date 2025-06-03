local is_neovide = vim.g.neovide or false
if is_neovide == false then
    function ColorMyPencils(color)
        -- color = color or "catppuccin-mocha"
        color = color or "sonokai"
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
end
