local M = {}

-- Theme-specific configurations
M.theme_configs = {
   vesper = {
     bufferline = {
       fill = { bg = "none" },
       background = { bg = "none", fg = "#82D9C2" },
       buffer_visible = { bg = "none", fg = "#82D9C2" },
       buffer_selected = { bg = "none", fg = "#82D9C2", bold = true },
       tab = { bg = "none", fg = "#82D9C2" },
       tab_selected = { bg = "none", fg = "#82D9C2", bold = true },
      tab_close = { bg = "none", fg = "#d4405b" },
       separator = { bg = "none", fg = "#333333" },
       separator_visible = { bg = "none", fg = "#333333" },
       separator_selected = { bg = "none", fg = "#333333" },
       close_button = { bg = "none", fg = "#d4405b" },
       close_button_selected = { bg = "none", fg = "#d4405b" },
       close_button_visible = { bg = "none", fg = "#d4405b" },
       modified = { bg = "none", fg = "#a5a6c0" },
       modified_selected = { bg = "none", fg = "#a5a6c0" },
       modified_visible = { bg = "none", fg = "#a5a6c0" },
      indicator_selected = { bg = "#82D9C2", fg = "#82D9C2" },
      -- Ensure icons have consistent background
       diagnostic = { bg = "none", fg = "#82D9C2" },
       diagnostic_visible = { bg = "none", fg = "#82D9C2" },
       diagnostic_selected = { bg = "none", fg = "#82D9C2" },
    },
    lualine = {
      theme = "auto",
      brighten_factor = 0,
      saturate_factor = 10,
    },
    floaterm = {
      term1 = { bg = "#000000", fg = "#82D9C2", border = "#7aa2f7" },
      term2 = { bg = "#000000", fg = "#82D9C2", border = "#7aa2f7" },
      term3 = { bg = "#000000", fg = "#82D9C2", border = "#e0af68" }, -- lazygit: gold
    }
  },

  ["catppuccin-mocha"] = {
     bufferline = {
       fill = { bg = "none" },
       background = { bg = "none", fg = "#cdd6f4" },
       buffer_visible = { bg = "none", fg = "#cdd6f4" },
       buffer_selected = { bg = "none", fg = "#f38ba8", bold = true },
       tab = { bg = "none", fg = "#cdd6f4" },
       tab_selected = { bg = "none", fg = "#f38ba8", bold = true },
      tab_close = { bg = "none", fg = "#f38ba8" },
       separator = { bg = "none", fg = "#45475a" },
       separator_visible = { bg = "none", fg = "#45475a" },
       separator_selected = { bg = "none", fg = "#45475a" },
       close_button = { bg = "none", fg = "#f38ba8" },
       close_button_selected = { bg = "none", fg = "#f38ba8" },
       close_button_visible = { bg = "none", fg = "#f38ba8" },
       modified = { bg = "none", fg = "#a6e3a1" },
       modified_selected = { bg = "none", fg = "#a6e3a1" },
       modified_visible = { bg = "none", fg = "#a6e3a1" },
      indicator_selected = { bg = "#f38ba8", fg = "#f38ba8" },
      -- Ensure icons have consistent background
       diagnostic = { bg = "none", fg = "#cdd6f4" },
       diagnostic_visible = { bg = "none", fg = "#cdd6f4" },
       diagnostic_selected = { bg = "none", fg = "#f38ba8" },
    },
    lualine = {
      theme = "catppuccin",
      brighten_factor = 0.1,
      saturate_factor = 1.2,
    },
    floaterm = {
      term1 = { bg = "#1e1e2e", fg = "#cdd6f4", border = "#89b4fa" },
      term2 = { bg = "#1e1e2e", fg = "#cdd6f4", border = "#89b4fa" },
      term3 = { bg = "#1e1e2e", fg = "#cdd6f4", border = "#f9e2af" }, -- lazygit: yellow
    }
  },

  ["rose-pine"] = {
     bufferline = {
       fill = { bg = "none" },
       background = { bg = "none", fg = "#e0def4" },
       buffer_visible = { bg = "none", fg = "#e0def4" },
       buffer_selected = { bg = "none", fg = "#eb6f92", bold = true },
       tab = { bg = "none", fg = "#e0def4" },
       tab_selected = { bg = "none", fg = "#eb6f92", bold = true },
      tab_close = { bg = "none", fg = "#eb6f92" },
       separator = { bg = "none", fg = "#403d52" },
       separator_visible = { bg = "none", fg = "#403d52" },
       separator_selected = { bg = "none", fg = "#403d52" },
       close_button = { bg = "none", fg = "#eb6f92" },
       close_button_selected = { bg = "none", fg = "#eb6f92" },
       close_button_visible = { bg = "none", fg = "#eb6f92" },
       modified = { bg = "none", fg = "#9ccfd8" },
       modified_selected = { bg = "none", fg = "#9ccfd8" },
       modified_visible = { bg = "none", fg = "#9ccfd8" },
      indicator_selected = { bg = "#eb6f92", fg = "#eb6f92" },
      -- Ensure icons have consistent background
       diagnostic = { bg = "none", fg = "#e0def4" },
       diagnostic_visible = { bg = "none", fg = "#e0def4" },
       diagnostic_selected = { bg = "none", fg = "#eb6f92" },
    },
    lualine = {
      theme = "rose-pine",
      brighten_factor = 0.05,
      saturate_factor = 1.1,
    },
    floaterm = {
      term1 = { bg = "#191724", fg = "#e0def4", border = "#31748f" },
      term2 = { bg = "#191724", fg = "#e0def4", border = "#31748f" },
      term3 = { bg = "#191724", fg = "#e0def4", border = "#f6c177" }, -- lazygit: gold
    }
  },

   sonokai = {
     bufferline = {
       fill = { bg = "none" },
       background = { bg = "none", fg = "#e2e2e3" },
       buffer_visible = { bg = "none", fg = "#e2e2e3" },
       buffer_selected = { bg = "none", fg = "#e2e2e3", bold = true },
       tab = { bg = "none", fg = "#e2e2e3" },
       tab_selected = { bg = "none", fg = "#e2e2e3", bold = true },
      tab_close = { bg = "none", fg = "#fc5d7c" },
       separator = { bg = "none", fg = "#414550" },
       separator_visible = { bg = "none", fg = "#414550" },
       separator_selected = { bg = "none", fg = "#414550" },
       close_button = { bg = "none", fg = "#fc5d7c" },
       close_button_selected = { bg = "none", fg = "#fc5d7c" },
       close_button_visible = { bg = "none", fg = "#fc5d7c" },
       modified = { bg = "none", fg = "#98c379" },
       modified_selected = { bg = "none", fg = "#98c379" },
       modified_visible = { bg = "none", fg = "#98c379" },
      indicator_selected = { bg = "#61afef", fg = "#61afef" },
      -- Ensure icons have consistent background
       diagnostic = { bg = "none", fg = "#e2e2e3" },
       diagnostic_visible = { bg = "none", fg = "#e2e2e3" },
       diagnostic_selected = { bg = "none", fg = "#e2e2e3" },
    },
    lualine = {
      theme = "sonokai",
      brighten_factor = 0.08,
      saturate_factor = 1.3,
    },
    floaterm = {
      term1 = { bg = "#2c2e34", fg = "#e2e2e3", border = "#61afef" },
      term2 = { bg = "#2c2e34", fg = "#e2e2e3", border = "#61afef" },
      term3 = { bg = "#2c2e34", fg = "#e2e2e3", border = "#e5c463" }, -- lazygit: yellow
    }
  },

   nord = {
     bufferline = {
       fill = { bg = "none" },
       background = { bg = "none", fg = "#d8dee9" },
       buffer_visible = { bg = "none", fg = "#d8dee9" },
       buffer_selected = { bg = "none", fg = "#88c0d0", bold = true },
       tab = { bg = "none", fg = "#d8dee9" },
       tab_selected = { bg = "none", fg = "#88c0d0", bold = true },
      tab_close = { bg = "none", fg = "#bf616a" },
       separator = { bg = "none", fg = "#4c566a" },
       separator_visible = { bg = "none", fg = "#4c566a" },
       separator_selected = { bg = "none", fg = "#4c566a" },
       close_button = { bg = "none", fg = "#bf616a" },
       close_button_selected = { bg = "none", fg = "#bf616a" },
       close_button_visible = { bg = "none", fg = "#bf616a" },
       modified = { bg = "none", fg = "#a3be8c" },
       modified_selected = { bg = "none", fg = "#a3be8c" },
       modified_visible = { bg = "none", fg = "#a3be8c" },
      indicator_selected = { bg = "#88c0d0", fg = "#88c0d0" },
      -- Ensure icons have consistent background
       diagnostic = { bg = "none", fg = "#d8dee9" },
       diagnostic_visible = { bg = "none", fg = "#d8dee9" },
       diagnostic_selected = { bg = "none", fg = "#88c0d0" },
    },
    lualine = {
      theme = "nord",
      brighten_factor = 0.06,
      saturate_factor = 1.15,
    },
    floaterm = {
      term1 = { bg = "#2e3440", fg = "#d8dee9", border = "#81a1c1" },
      term2 = { bg = "#2e3440", fg = "#d8dee9", border = "#81a1c1" },
      term3 = { bg = "#2e3440", fg = "#d8dee9", border = "#ebcb8b" }, -- lazygit: yellow
    }
  }
}

-- Apply bufferline configuration
function M.apply_bufferline_config(theme_name)
  local config = M.theme_configs[theme_name]
  if not config then return end

  local bufferline = require('bufferline')

  bufferline.setup({
    options = {
      mode = 'buffers',
      style_preset = bufferline.style_preset.minimal,
      themable = true,
      numbers = 'none',
      close_command = 'bdelete! %d',
      right_mouse_command = 'bdelete! %d',
      left_mouse_command = 'buffer %d',
      middle_mouse_command = nil,
      buffer_close_icon = '',
      close_icon = '',
      path_components = 1,
      modified_icon = '●',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 25,
      max_prefix_length = 20,
      tab_size = 20,
      diagnostics = false,
      diagnostics_update_in_insert = false,
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true,
        }
      },
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      persist_buffer_sort = true,
      separator_style = "thin",
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      show_tab_indicators = false,
      hover = {
        enabled = true,
        delay = 200,
        reveal = {'close'}
      },
      indicator = {
        icon = '│',
        style = 'icon',
      },
      icon_pinned = '󰐃',
      minimum_padding = 2,
      maximum_padding = 4,
      maximum_length = 15,
      sort_by = 'insert_at_end',
    },
    highlights = config.bufferline,
  })

  -- Force bufferline to refresh and redraw
  vim.cmd('redrawtabline')
end

-- Apply lualine configuration
function M.apply_lualine_config(theme_name)
  local config = M.theme_configs[theme_name]
  if not config then return end

  -- Convert hex to RGB
  local function hex2rgb(hex)
    hex = hex:gsub("#","")
    return tonumber(hex:sub(1,2),16), tonumber(hex:sub(3,4),16), tonumber(hex:sub(5,6),16)
  end

  -- Convert RGB to hex
  local function rgb2hex(r,g,b)
    return string.format("#%02X%02X%02X", r, g, b)
  end

  -- Convert RGB to HSL
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

  -- Convert HSL to RGB
  local function hsl2rgb(h, s, l)
    local function f(n)
      local k = (n + h * 12) % 12
      local a = s * math.min(l, 1 - l)
      return l - a * math.max(math.min(k - 3, 9 - k, 1), -1)
    end
    return math.floor(f(0) * 255 + 0.5), math.floor(f(8) * 255 + 0.5), math.floor(f(4) * 255 + 0.5)
  end

  -- Brighten and saturate a hex color
  local function brighten_and_saturate(hex, brighten_factor, saturate_factor)
    if not hex or hex == "NONE" then return hex end
    local r, g, b = hex2rgb(hex)
    -- Brighten
    r = math.floor(r + (255 - r) * brighten_factor)
    g = math.floor(g + (255 - g) * brighten_factor)
    b = math.floor(b + (255 - b) * brighten_factor)
    -- Saturate
    local h, s, l = rgb2hsl(r, g, b)
    s = math.min(1, s * saturate_factor)
    r, g, b = hsl2rgb(h, s, l)
    return rgb2hex(r, g, b)
  end

  -- Force reload lualine theme to ensure proper updates
  package.loaded['lualine.themes.auto'] = nil
  local auto = require("lualine.themes.auto")
  local brighten_factor = config.lualine.brighten_factor or 0
  local saturate_factor = config.lualine.saturate_factor or 1

   for _, mode in ipairs({ "normal", "insert", "visual", "replace", "command", "inactive" }) do
     for _, section in ipairs({ "a", "b", "x", "y", "z" }) do
       if auto[mode] and auto[mode][section] and auto[mode][section].bg and auto[mode][section].bg ~= "NONE" then
         auto[mode][section].bg = brighten_and_saturate(auto[mode][section].bg, brighten_factor, saturate_factor)
       end
     end
     -- Keep section c transparent for all themes
     if auto[mode] and auto[mode].c then
       auto[mode].c.bg = "NONE"
       auto[mode].c.fg = nil  -- Let it inherit from theme
     end
   end

  local show_macro = function()
    local reg = vim.fn.reg_recording()
    return reg ~= '' and 'REC @' .. reg or ''
  end

  -- Force lualine to reload completely
  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = auto,
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
    disabled_filetypes={}
  }

  -- Force immediate refresh
  require('lualine').refresh()
end

-- Apply floaterm configuration
function M.apply_floaterm_config(theme_name)
  local config = M.theme_configs[theme_name]
  if not config then return end

  -- Update floaterm colors based on theme
  vim.api.nvim_create_autocmd("User", {
    pattern = "FloatermOpen",
    callback = function()
      local name = vim.b.floaterm_name
      local colors = config.floaterm[name] or config.floaterm.term1

      vim.cmd(string.format([[
        highlight Floaterm guibg=%s guifg=%s
        highlight FloatermBorder guibg=NONE guifg=%s
      ]], colors.bg, colors.fg, colors.border))
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "FloatermHide",
    callback = function()
      local colors = config.floaterm.term1
      vim.cmd(string.format([[
        highlight Floaterm guibg=%s guifg=%s
        highlight FloatermBorder guibg=NONE guifg=%s
      ]], colors.bg, colors.fg, colors.border))
    end,
  })
end

-- Apply all theme integrations
function M.apply_theme_integrations(theme_name)
  -- Clear all bufferline highlights first to prevent theme bleed
  local highlights_to_clear = {
    'BufferLineFill',
    'BufferLineBackground',
    'BufferLineBufferVisible',
    'BufferLineBufferSelected',
    'BufferLineSeparator',
    'BufferLineSeparatorVisible',
    'BufferLineSeparatorSelected',
    'BufferLineIndicatorSelected',
    'BufferLineModified',
    'BufferLineModifiedVisible',
    'BufferLineModifiedSelected',
    'BufferLineCloseButton',
    'BufferLineCloseButtonVisible',
    'BufferLineCloseButtonSelected',
    'BufferLineTab',
    'BufferLineTabSelected',
    'BufferLineTabClose',
    'BufferLineNumbers',
    'BufferLineNumbersVisible',
    'BufferLineNumbersSelected',
    'BufferLineDiagnostic',
    'BufferLineDiagnosticVisible',
    'BufferLineDiagnosticSelected',
    'BufferLineHint',
    'BufferLineHintVisible',
    'BufferLineHintSelected',
    'BufferLineInfo',
    'BufferLineInfoVisible',
    'BufferLineInfoSelected',
    'BufferLineWarning',
    'BufferLineWarningVisible',
    'BufferLineWarningSelected',
    'BufferLineError',
    'BufferLineErrorVisible',
    'BufferLineErrorSelected'
  }

  for _, highlight in ipairs(highlights_to_clear) do
    vim.cmd('silent! highlight clear ' .. highlight)
  end

  -- Apply configurations in order
  M.apply_bufferline_config(theme_name)
  M.apply_lualine_config(theme_name)
  M.apply_floaterm_config(theme_name)

  -- Force redraw to ensure everything updates
  vim.cmd('redraw!')
  vim.cmd('redrawtabline')

  -- Small delay to ensure highlights are applied
  vim.defer_fn(function()
    vim.cmd('redraw!')
  end, 10)
end

return M