local cmp = require("cmp")
local luasnip = require("luasnip")

-- Load friendly snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Add React snippets for specific filetypes
require("luasnip.loaders.from_vscode").lazy_load({
    paths = {
        vim.fn.stdpath("data") .. "/site/pack/packer/start/friendly-snippets/snippets",
    },
    include = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },
})

-- Configure LuaSnip
luasnip.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
})

-- Snippet navigation keymaps (Ctrl+L forward, Ctrl+H back, Ctrl+E choice)
vim.keymap.set({"i", "s"}, "<C-l>", function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({"i", "s"}, "<C-h>", function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, { silent = true })

-- Configure Tab behavior
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, false)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),

        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-space>"] = cmp.mapping.complete(),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
    formatting = {
        format = require("nvim-highlight-colors").format
    }
})

-- Setup for command line completion
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})
