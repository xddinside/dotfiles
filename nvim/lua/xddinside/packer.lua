-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    use {
      'rose-pine/neovim',
      as = 'rose-pine',
      config = function()
        vim.cmd('colorscheme rose-pine')  -- Set the colorscheme to rose-pine
      end
    }

--	use({
--		'catppuccin/nvim',
--		as = 'catppuccin',
--		config = function()
--			vim.cmd('colorscheme catppuccin-mocha') -- Set the colorscheme to catppuccin
--		end
--	})

    -- Smart-open for better telescope results
    use {
        "danielfalk/smart-open.nvim",
        branch = "0.2.x",
        config = function()
            require"telescope".load_extension("smart_open")
        end,
        requires = {
            {"kkharji/sqlite.lua"},
        }
    }

    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    })

    use {
      'stevearc/overseer.nvim',
      config = function() require('overseer').setup() end
    }

    use {
      "Rics-Dev/project-explorer.nvim",
      requires = {
        "nvim-telescope/telescope.nvim", -- This is the dependency
      }
    }

    use({
        'MeanderingProgrammer/render-markdown.nvim',
        after = { 'nvim-treesitter' },
        -- requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
        -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
        config = function()
            require('render-markdown').setup({})
        end,
    })

    use{
        "folke/snacks.nvim",
        config = function()
            require("snacks").setup({
                image = {
                  -- This keeps the image on the top right corner, basically leaving your
                  -- text area free, suggestion found in reddit by user `Redox_ahmii`
                  -- https://www.reddit.com/r/neovim/comments/1irk9mg/comment/mdfvk8b/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
                  styles = {
                    snacks_image = {
                      relative = "editor",
                      col = -1,
                    },
                  },
                  image = {
                      enabled = true,
                      doc = {
                          -- Personally I set this to false, I don't want to render all the
                          -- images in the file, only when I hover over them
                          -- render the image inline in the buffer
                          -- if your env doesn't support unicode placeholders, this will be disabled
                          -- takes precedence over `opts.float` on supported terminals
                          inline = false,
                          -- render the image in a floating window
                          -- only used if `opts.inline` is disabled
                          float = true,
                          -- Sets the size of the image
                          max_width = vim.g.neovim_mode == 20 or 60,
                          max_height = vim.g.neovim_mode == 10 or 30,
                          -- max_width = 60,
                          -- max_height = 30,
                          -- Apparently, all the images that you preview in neovim are converted
                          -- to .png and they're cached, original image remains the same, but
                          -- the preview you see is a png converted version of that image
                          --
                          -- Where are the cached images stored?
                          -- This path is found in the docs
                          -- :lua print(vim.fn.stdpath("cache") .. "/snacks/image")
                          -- For me returns `~/.cache/neobean/snacks/image`
                          -- Go 1 dir above and check `sudo du -sh ./* | sort -hr | head -n 5`
                        },
                    },
                }
            })
        end
    }

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use { "kkharji/sqlite.lua" }

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use('ThePrimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use('folke/zen-mode.nvim')
	use('ThePrimeagen/vim-be-good')
	use('mattn/emmet-vim')
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

    -- LSP and dependencies
    use('neovim/nvim-lspconfig') -- Collection of configurations for built-in LSP client
    use ('williamboman/mason.nvim') -- Manage external editor tooling i.e LSP servers
    use ('williamboman/mason-lspconfig.nvim') -- Mason LSP support
    use ('hrsh7th/nvim-cmp') -- Autocompletion plugin
    use ('hrsh7th/cmp-nvim-lsp') -- LSP source for nvim-cmp
    use ('L3MON4D3/LuaSnip') -- Snippets plugin
    use ('hrsh7th/cmp-cmdline')  -- Command line completion 

    -- Optional UI improvements
    use 'glepnir/lspsaga.nvim' -- LSP UIs
    use 'onsails/lspkind-nvim' -- Adds vscode-like pictograms to neovim built-in lsp
end)
