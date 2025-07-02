-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/xdd/.cache/nvim/packer_hererocks/2.1.1748459687/share/lua/5.1/?.lua;/home/xdd/.cache/nvim/packer_hererocks/2.1.1748459687/share/lua/5.1/?/init.lua;/home/xdd/.cache/nvim/packer_hererocks/2.1.1748459687/lib/luarocks/rocks-5.1/?.lua;/home/xdd/.cache/nvim/packer_hererocks/2.1.1748459687/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/xdd/.cache/nvim/packer_hererocks/2.1.1748459687/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["autoclose.nvim"] = {
    config = { "\27LJ\2\n¯\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\1\foptions\0\23disabled_filetypes\1\3\0\0\ttext\rmarkdown\1\0\2\23disable_when_touch\2\23disabled_filetypes\0\nsetup\14autoclose\frequire\0" },
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/autoclose.nvim",
    url = "https://github.com/m4xshen/autoclose.nvim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["colortils.nvim"] = {
    commands = { "Colortils" },
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colortils\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/opt/colortils.nvim",
    url = "https://github.com/max397574/colortils.nvim"
  },
  ["doing.nvim"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/doing.nvim",
    url = "https://github.com/Hashino/doing.nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["godoc.nvim"] = {
    commands = { "GoDoc" },
    config = { "\27LJ\2\n„\2\0\0\5\0\r\0\0226\0\0\0'\2\1\0B\0\2\0025\1\3\0005\2\2\0=\2\4\0015\2\5\0004\3\0\0=\3\6\0024\3\0\0=\3\a\0024\3\0\0=\3\b\0024\3\0\0=\3\t\0024\3\0\0=\3\n\2=\2\v\0019\2\f\0\18\4\1\0B\2\2\1K\0\1\0\nsetup\vpicker\ffzf_lua\tmini\vsnacks\14telescope\vnative\1\0\6\vsnacks\0\ttype\14telescope\tmini\0\vnative\0\ffzf_lua\0\14telescope\0\vwindow\1\0\2\vwindow\0\vpicker\0\1\0\1\ttype\vvsplit\ngodoc\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/opt/godoc.nvim",
    url = "https://github.com/fredrikaverpil/godoc.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["image.nvim"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/image.nvim",
    url = "https://github.com/3rd/image.nvim"
  },
  ["inc-rename.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15inc_rename\frequire\0" },
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/inc-rename.nvim",
    url = "https://github.com/smjonas/inc-rename.nvim"
  },
  ["indentmini.nvim"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/indentmini.nvim",
    url = "https://github.com/nvimdev/indentmini.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neo-tree.nvim"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["noice.nvim"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-highlight-colors"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/nvim-highlight-colors",
    url = "https://github.com/brenoprata10/nvim-highlight-colors"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\nT\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\vstages\vstatic\ftimeout\3Ð\15\nsetup\vnotify\frequire\0" },
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["project-explorer.nvim"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/project-explorer.nvim",
    url = "https://github.com/Rics-Dev/project-explorer.nvim"
  },
  ["render-markdown.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\20render-markdown\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/opt/render-markdown.nvim",
    url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"
  },
  ["smart-open.nvim"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\15smart_open\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/smart-open.nvim",
    url = "https://github.com/danielfalk/smart-open.nvim"
  },
  sonokai = {
    config = { "\27LJ\2\n­\2\0\0\5\0\15\0\0316\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\a\0'\2\b\0B\0\2\0016\0\0\0009\0\t\0009\0\n\0)\2\0\0'\3\v\0005\4\f\0B\0\4\0016\0\0\0009\0\t\0009\0\n\0)\2\0\0'\3\r\0005\4\14\0B\0\4\1K\0\1\0\1\0\1\abg\tNONE\17StatusLineNC\1\0\1\abg\tNONE\15StatusLine\16nvim_set_hl\bapi\24colorscheme sonokai\bcmd\14andromeda\17sonaki_style\26sonokai_enable_italic\0061#sonokai_transparent_background\6g\bvim\0" },
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/sonokai",
    url = "https://github.com/sainnhe/sonokai"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/kkharji/sqlite.lua"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-be-good"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/vim-be-good",
    url = "https://github.com/ThePrimeagen/vim-be-good"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["zen-mode.nvim"] = {
    loaded = true,
    path = "/home/xdd/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: inc-rename.nvim
time([[Config for inc-rename.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15inc_rename\frequire\0", "config", "inc-rename.nvim")
time([[Config for inc-rename.nvim]], false)
-- Config for: sonokai
time([[Config for sonokai]], true)
try_loadstring("\27LJ\2\n­\2\0\0\5\0\15\0\0316\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\a\0'\2\b\0B\0\2\0016\0\0\0009\0\t\0009\0\n\0)\2\0\0'\3\v\0005\4\f\0B\0\4\0016\0\0\0009\0\t\0009\0\n\0)\2\0\0'\3\r\0005\4\14\0B\0\4\1K\0\1\0\1\0\1\abg\tNONE\17StatusLineNC\1\0\1\abg\tNONE\15StatusLine\16nvim_set_hl\bapi\24colorscheme sonokai\bcmd\14andromeda\17sonaki_style\26sonokai_enable_italic\0061#sonokai_transparent_background\6g\bvim\0", "config", "sonokai")
time([[Config for sonokai]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\nT\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\vstages\vstatic\ftimeout\3Ð\15\nsetup\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: autoclose.nvim
time([[Config for autoclose.nvim]], true)
try_loadstring("\27LJ\2\n¯\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\1\foptions\0\23disabled_filetypes\1\3\0\0\ttext\rmarkdown\1\0\2\23disable_when_touch\2\23disabled_filetypes\0\nsetup\14autoclose\frequire\0", "config", "autoclose.nvim")
time([[Config for autoclose.nvim]], false)
-- Config for: smart-open.nvim
time([[Config for smart-open.nvim]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\15smart_open\19load_extension\14telescope\frequire\0", "config", "smart-open.nvim")
time([[Config for smart-open.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd render-markdown.nvim ]]

-- Config for: render-markdown.nvim
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\20render-markdown\frequire\0", "config", "render-markdown.nvim")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Colortils', function(cmdargs)
          require('packer.load')({'colortils.nvim'}, { cmd = 'Colortils', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'colortils.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Colortils ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GoDoc', function(cmdargs)
          require('packer.load')({'godoc.nvim'}, { cmd = 'GoDoc', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'godoc.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GoDoc ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)


_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
