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

	use({
		'catppuccin/nvim',
		as = 'catppuccin',
		config = function()
			vim.cmd('colorscheme catppuccin-mocha')
		end
	})

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

    use { "kkharji/sqlite.lua" }

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use('ThePrimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use('folke/zen-mode.nvim')
	use('ThePrimeagen/vim-be-good')
	use('mattn/emmet-vim')

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
