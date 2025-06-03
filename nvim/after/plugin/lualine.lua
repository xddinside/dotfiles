-- 640 in undotree (before all this color stuff)

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

local auto = require("lualine.themes.auto")
local brighten_factor = 0    -- Increase for more brightness
local saturate_factor = 10    -- Increase for more saturation

for _, mode in ipairs({ "normal", "insert", "visual", "replace", "command", "inactive" }) do
  for _, section in ipairs({ "a", "z" }) do
    if auto[mode] and auto[mode][section] and auto[mode][section].bg and auto[mode][section].bg ~= "NONE" then
      auto[mode][section].bg = brighten_and_saturate(auto[mode][section].bg, brighten_factor, saturate_factor)
    end
  end
  -- If you still want section c transparent:
  if auto[mode] and auto[mode].c then
    auto[mode].c.bg = "NONE"
  end
end

local show_macro = function()
  local reg = vim.fn.reg_recording()
  return reg ~= '' and 'REC @' .. reg or ''
end

-- creating keymap for toggling Doing in lualine (if native doesn't work)
--
-- vim.g.doing_status_in_lualine = true
-- vim.keymap.set("n", "<leader>dl", function()
--     vim.g.doing_status_in_lualine = not vim..doing_status_in_lualine
--     require("lualine").refresh()
-- end, { desc = "Toggle [D]oing status in [L]ualine" })

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = auto,
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

--     lualine_c = {{function() return require("doing").status() end,
--     cond = function() return vim.g.doing_status_in_lualine end,},
--     show_macro
-- },
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
