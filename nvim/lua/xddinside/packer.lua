-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- use {
  --   'sainnhe/sonokai',
  --   priority = 1000,
  --   as = 'sonokai',
  --   config = function()
  --     vim.g.sonokai_transparent_background = "1"
  --     vim.g.sonokai_enable_italic = "1"
  --     vim.g.sonaki_style = "andromeda"
  --     vim.cmd('colorscheme sonokai')
  --     vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
  --     vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
  --   end,
  -- }

  use {'datsfilipe/vesper.nvim'}

  -- use {
  --   'rose-pine/neovim',
  --   as = 'rose-pine',
  --   config = function()
  --     vim.cmd('colorscheme rose-pine')  -- Set the colorscheme to rose-pine
  --   end
  -- }

  --	use({
  --		'catppuccin/nvim',
  --		as = 'catppuccin',
  --		config = function()
  --			vim.cmd('colorscheme catppuccin-mocha') -- Set the colorscheme to catppuccin
  --		end
  --	})

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
    'rcarriga/nvim-notify',
    config = function ()
      require("notify").setup({
        timeout = 2000,
        stages = 'static'
      })
    end,
  }
  use {
    'folke/noice.nvim',
    requires = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
      opt = true
    }
  }

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
    "Rics-Dev/project-explorer.nvim",
    requires = {
      "nvim-telescope/telescope.nvim", -- This is the dependency
    }
  }

  use({
    'MeanderingProgrammer/render-markdown.nvim',
    after = { 'nvim-treesitter' },
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
    config = function()
      require('render-markdown').setup({})
    end,
  })

  use {
    'windwp/nvim-ts-autotag'
  }

  use ({
    'm4xshen/autoclose.nvim',
    config = function ()
      require("autoclose").setup({
        options={
          disable_when_touch = true,
          disabled_filetypes = { "text", "markdown" },
        }
      })
    end
  }) -- Autocomplete brackets

  use {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  }

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = function()
      require("colortils").setup()
    end,
  }

  use {
    "fredrikaverpil/godoc.nvim",
    requires = {
      { "nvim-telescope/telescope.nvim" }, -- optional
      { "nvim-treesitter/nvim-treesitter" }, -- optional
    },
    run = "go install github.com/lotusirous/gostdsym/stdsym@latest", -- optional
    cmd = { "GoDoc" }, -- optional
    config = function()
      local godoc = require("godoc")
      ---@type godoc.types.GoDocConfig
      local config = {
        window = {
          type = "vsplit", -- split | vsplit
        },
        picker = {
          type = "telescope", -- native (vim.ui.select) | telescope | snacks | mini | fzf_lua
          native = {},
          telescope = {},
          snacks = {},
          mini = {},
          fzf_lua = {},
        },
      }
      godoc.setup(config)
    end,
  }

  use {
    'goolord/alpha-nvim',
    config = function ()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }

  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })

  use {"nvimdev/indentmini.nvim"}

  use { "kkharji/sqlite.lua" }
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use { 'nvim-tree/nvim-web-devicons' }
  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('folke/zen-mode.nvim')
  use('ThePrimeagen/vim-be-good')
  use('mattn/emmet-vim')
  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = {'nvim-tree/nvim-web-devicons', 'datsfilipe/vesper.nvim'},
    config = function ()
     local bufferline = require('bufferline')
      require('bufferline').setup({
        highlights = require('vesper').bufferline.highlights,
      })
    end
  }
  use {"Hashino/doing.nvim"}
  use {'voldikss/vim-floaterm'}
  use {'brenoprata10/nvim-highlight-colors'}

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
