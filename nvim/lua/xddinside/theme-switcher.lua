local M = {}

-- Available themes
M.themes = {
  { name = "vesper", display = "Vesper" },
  { name = "catppuccin-mocha", display = "Catppuccin Mocha" },
  { name = "rose-pine", display = "Rose Pine" },
  { name = "sonokai", display = "Sonokai" },
  { name = "nord", display = "Nord" },
  { name = "chai", display = "Chai" },
}

-- Map theme names to their actual colorscheme commands
M.theme_colorschemes = {
  vesper = "vesper",
  ["catppuccin-mocha"] = "catppuccin-mocha",
  ["rose-pine"] = "rose-pine",
  sonokai = "sonokai",
  nord = "nord",
  chai = "chai",
}

-- File to store the current theme
M.theme_file = vim.fn.stdpath('config') .. '/current_theme.txt'

-- Load saved theme or default to vesper
function M.load_saved_theme()
  local file = io.open(M.theme_file, 'r')
  if file then
    local theme = file:read('*all'):gsub('%s+', '')
    file:close()
    return theme ~= '' and theme or 'vesper'
  end
  return 'vesper'
end

-- Save current theme
function M.save_theme(theme)
  local file = io.open(M.theme_file, 'w')
  if file then
    file:write(theme)
    file:close()
  end
end

-- Helper functions for color manipulation
local function hex2rgb(hex)
  hex = hex:gsub("#","")
  return tonumber(hex:sub(1,2),16), tonumber(hex:sub(3,4),16), tonumber(hex:sub(5,6),16)
end

local function rgb2hex(r,g,b)
  return string.format("#%02X%02X%02X", r, g, b)
end

local function rgb2hsl(r, g, b)
  r, g, b = r/255, g/255, b/255
  local max, min = math.max(r,g,b), math.min(r,g,b)
  local h, s, l
  l = (max + min) / 2
  if max == min then
    h, s = 0, 0
  else
    local d = max - min
    s = l > 0.5 and d / (2 - max - min) or d / (max + min)
    if max == r then
      h = (g - b) / d + (g < b and 6 or 0)
    elseif max == g then
      h = (b - r) / d + 2
    else
      h = (r - g) / d + 4
    end
    h = h / 6
  end
  return h, s, l
end

local function hsl2rgb(h, s, l)
  local function f(n)
    local k = (n + h * 12) % 12
    local a = s * math.min(l, 1 - l)
    return l - a * math.max(math.min(k - 3, 9 - k, 1), -1)
  end
  return math.floor(f(0) * 255 + 0.5), math.floor(f(8) * 255 + 0.5), math.floor(f(4) * 255 + 0.5)
end

local function brighten_and_saturate(hex, brighten_factor, saturate_factor)
  if not hex or hex == "NONE" then return hex end
  local r, g, b = hex2rgb(hex)
  r = math.floor(r + (255 - r) * brighten_factor)
  g = math.floor(g + (255 - g) * brighten_factor)
  b = math.floor(b + (255 - b) * brighten_factor)
  local h, s, l = rgb2hsl(r, g, b)
  s = math.min(1, s * saturate_factor)
  r, g, b = hsl2rgb(h, s, l)
  return rgb2hex(r, g, b)
end

-- Helper to get highlight color (module-level, uses non-deprecated API)
local function get_color(group, attr)
  local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
  if hl and hl[attr] then
    return string.format("#%06x", hl[attr])
  end
  return nil
end

-- Update bufferline highlights dynamically
function M.update_bufferline_highlights(theme_name)
  if not pcall(require, 'bufferline') then return end

  -- Get colors from current theme (using "fg"/"bg" for nvim_get_hl)
  local comment_fg = get_color("Comment", "fg") or "#555555"
  local string_fg = get_color("String", "fg") or "#999999"
  local error_fg = get_color("Error", "fg") or "#ff0000"
  
  -- For the selected tab background, we want something distinct.
  local selected_bg = get_color("Visual", "bg") or get_color("PmenuSel", "bg") or get_color("TabLineSel", "bg") or "#333333"
  
  -- Accents
  local keyword_fg = get_color("Keyword", "fg") or "#ff00ff"
  local function_fg = get_color("Function", "fg") or "#0000ff"

  -- DESIGN LOGIC:
  -- Global transparency: All themes use transparent fill with colored selected tab
  
  local fill_bg = "NONE"
  local inactive_bg = "NONE"
  
  local highlights = {
    fill = { bg = fill_bg },
    background = { bg = inactive_bg, fg = comment_fg },
    
    -- Visible buffers (not selected, but visible)
    buffer_visible = { bg = inactive_bg, fg = comment_fg },
    
    -- Selected buffer
    -- Use the distinct selected_bg
    buffer_selected = { bg = selected_bg, fg = keyword_fg, bold = true, italic = false },
    
    -- Tabs (if used)
    tab = { bg = inactive_bg, fg = comment_fg },
    tab_selected = { bg = selected_bg, fg = keyword_fg, bold = true },
    tab_close = { bg = inactive_bg, fg = error_fg },
    
    -- Separators
    separator = { bg = inactive_bg, fg = inactive_bg }, 
    separator_visible = { bg = inactive_bg, fg = inactive_bg },
    separator_selected = { bg = "NONE", fg = "NONE" }, -- Keep selected separators clean
    
    close_button = { bg = inactive_bg, fg = comment_fg },
    close_button_selected = { bg = selected_bg, fg = error_fg },
    close_button_visible = { bg = inactive_bg, fg = comment_fg },
    
    modified = { bg = inactive_bg, fg = string_fg },
    modified_selected = { bg = selected_bg, fg = string_fg },
    modified_visible = { bg = inactive_bg, fg = string_fg },
    
    indicator_selected = { bg = selected_bg, fg = function_fg },
    
    numbers = { bg = inactive_bg, fg = comment_fg },
    numbers_selected = { bg = selected_bg, fg = keyword_fg },
    numbers_visible = { bg = inactive_bg, fg = comment_fg },
    
    -- Icons
    icon = { bg = inactive_bg, fg = comment_fg },
    icon_selected = { bg = selected_bg, fg = keyword_fg },
    icon_visible = { bg = inactive_bg, fg = comment_fg },
  }

  -- Apply bufferline highlights
  for group, colors in pairs(highlights) do
    local hl_group = 'BufferLine' .. group:gsub("^%l", string.upper)
    vim.api.nvim_set_hl(0, hl_group, colors)
  end
end

-- Update lualine theme
function M.update_lualine_theme(current_theme)
  if not pcall(require, 'lualine') then return end

  local lualine = require('lualine')
  
  -- Helper for macro recording status
  local show_macro = function()
      local reg = vim.fn.reg_recording()
      return reg ~= '' and 'REC @' .. reg or ''
  end

  -- Base configuration
  local config = {
    options = {
      icons_enabled = true,
      -- component_separators = { left = '', right = ''},
      -- section_separators = { left = '', right = ''},
      component_separators = { left = '|', right = ''},
      section_separators = { left = ' ', right = ''},
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      always_show_tabline = true,
      globalstatus = false,
      refresh = {
        statusline = 100,
        tabline = 100,
        winbar = 100,
      }
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {{function() return require("doing").status() end}, show_macro},
      lualine_x = {{'filename', path = 1}},
      lualine_y = {},
      lualine_z = {}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {{'filename', path = 1}},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {'neo-tree'},
  }
  
  if current_theme == "chai" then
     config.options.theme = "chai"
  else
      -- Reset auto theme cache
      package.loaded['lualine.themes.auto'] = nil
      local auto = require("lualine.themes.auto")
      
      -- Apply modifications (brighten/saturate)
      local brighten_factor = 0
      local saturate_factor = 1
      
      for _, mode in ipairs({ "normal", "insert", "visual", "replace", "command", "inactive" }) do
        for _, section in ipairs({ "a", "z" }) do
          if auto[mode] and auto[mode][section] and auto[mode][section].bg and auto[mode][section].bg ~= "NONE" then
            auto[mode][section].bg = brighten_and_saturate(auto[mode][section].bg, brighten_factor, saturate_factor)
          end
        end
        if auto[mode] and auto[mode].c then
          auto[mode].c.bg = "NONE"
        end
      end
      config.options.theme = auto
  end
  
  lualine.setup(config)
end

-- Apply theme with transparency and update all plugins
function M.apply_theme(theme_name)
  local colorscheme = M.theme_colorschemes[theme_name] or theme_name
  
  -- Set the colorscheme
  vim.cmd('colorscheme ' .. colorscheme)

  -- Apply transparency settings
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
  vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })

  -- Fix cursor visibility for Nord theme only
  if theme_name == "nord" then
    local cursor_bg = get_color("Normal", "fg") or "#D8DEE9" -- Nord's Snow Storm for fallback
    local cursor_fg = get_color("Normal", "bg") or "#2E3440" -- Nord's Polar Night for fallback
    
    -- Set cursor with proper contrast
    vim.api.nvim_set_hl(0, "Cursor", { bg = cursor_bg, fg = cursor_fg })
    vim.api.nvim_set_hl(0, "lCursor", { bg = cursor_bg, fg = cursor_fg })
    vim.api.nvim_set_hl(0, "CursorIM", { bg = cursor_bg, fg = cursor_fg })
    vim.api.nvim_set_hl(0, "TermCursor", { bg = cursor_bg, fg = cursor_fg })
    vim.api.nvim_set_hl(0, "vCursor", { bg = cursor_bg, fg = cursor_fg })
  end

  -- Update plugin highlights
  M.update_bufferline_highlights(theme_name)
  M.update_lualine_theme(theme_name)
  
  -- Save the theme
  M.save_theme(theme_name)

  -- Notify user
  vim.notify('Theme switched to: ' .. theme_name, vim.log.levels.INFO)
end

-- Telescope theme picker
function M.pick_theme()
  local pickers = require('telescope.pickers')
  local finders = require('telescope.finders')
  local conf = require('telescope.config').values
  local actions = require('telescope.actions')
  local action_state = require('telescope.actions.state')

  pickers.new({}, {
    prompt_title = 'Select Theme',
    finder = finders.new_table({
      results = M.themes,
      entry_maker = function(entry)
        return {
          value = entry.name,
          display = entry.display,
          ordinal = entry.display,
        }
      end,
    }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        if selection then
          M.apply_theme(selection.value)
        end
      end)
      return true
    end,
  }):find()
end

return M
