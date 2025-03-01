local is_neovide = vim.g.neovide or false

if is_neovide then
    require("project_explorer").setup({
        paths = {
            "~/dev/",
            "~/dotfiles/",
            "~/notes/"
        }, -- Custom path set by user
        newProjectPath = "~/dev/", -- Custom path for new projects
        file_explorer = function(dir) -- Custom file explorer
            vim.cmd("Neotree close")
            vim.cmd("Neotree " .. dir)
        end,
        })

        vim.keymap.set("n", "<leader>fp", "<cmd>ProjectExplorer<CR>", { noremap = true, silent = true })
end

