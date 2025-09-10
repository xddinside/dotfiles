local M = {}

-- Available themes
M.themes = {
  { name = "vesper", display = "Vesper" },
  { name = "catppuccin-mocha", display = "Catppuccin Mocha" },
  { name = "rose-pine", display = "Rose Pine" },
  { name = "sonokai", display = "Sonokai" },
  { name = "nord", display = "Nord" },
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

-- Apply theme with transparency
function M.apply_theme(theme_name)
  vim.cmd('colorscheme ' .. theme_name)

  -- Apply transparency settings
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

  -- Apply theme integrations (bufferline, lualine, floaterm)
  local integrations = require('xddinside.theme-integrations')
  integrations.apply_theme_integrations(theme_name)

  -- Save the theme
  M.save_theme(theme_name)

  -- Force a complete redraw to ensure all UI elements update
  vim.defer_fn(function()
    vim.cmd('redraw!')
    vim.cmd('redrawtabline')
    vim.cmd('redrawstatus!')

    -- Force lualine to refresh all sections
    if pcall(require, 'lualine') then
      require('lualine').refresh()
    end

    -- Ensure lualine section c stays transparent
    vim.api.nvim_set_hl(0, "lualine_c_normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "lualine_c_insert", { bg = "none" })
    vim.api.nvim_set_hl(0, "lualine_c_visual", { bg = "none" })
    vim.api.nvim_set_hl(0, "lualine_c_replace", { bg = "none" })
    vim.api.nvim_set_hl(0, "lualine_c_command", { bg = "none" })
    vim.api.nvim_set_hl(0, "lualine_c_inactive", { bg = "none" })
  end, 100)

   -- Debug: Check if transparency is applied
   vim.defer_fn(function()
     local hl = vim.api.nvim_get_hl(0, { name = "lualine_c_normal" })
     vim.notify('lualine_c_normal bg: ' .. (hl.bg or "nil"), vim.log.levels.INFO)

     -- Force transparency one more time
     vim.api.nvim_set_hl(0, "lualine_c_normal", { bg = "none" })
     vim.api.nvim_set_hl(0, "lualine_c_insert", { bg = "none" })
     vim.api.nvim_set_hl(0, "lualine_c_visual", { bg = "none" })
     vim.api.nvim_set_hl(0, "lualine_c_replace", { bg = "none" })
     vim.api.nvim_set_hl(0, "lualine_c_command", { bg = "none" })
     vim.api.nvim_set_hl(0, "lualine_c_inactive", { bg = "none" })

     -- Force bufferline redraw
     vim.cmd('redrawtabline')
   end, 500)

   -- Add commands to manually refresh transparency and check status
   vim.api.nvim_create_user_command('RefreshTransparency', function()
     -- Apply lualine transparency
     vim.api.nvim_set_hl(0, "lualine_c_normal", { bg = "none" })
     vim.api.nvim_set_hl(0, "lualine_c_insert", { bg = "none" })
     vim.api.nvim_set_hl(0, "lualine_c_visual", { bg = "none" })
     vim.api.nvim_set_hl(0, "lualine_c_replace", { bg = "none" })
     vim.api.nvim_set_hl(0, "lualine_c_command", { bg = "none" })
     vim.api.nvim_set_hl(0, "lualine_c_inactive", { bg = "none" })

     -- Force bufferline redraw
     vim.cmd('redrawtabline')

     -- Force lualine refresh
     if pcall(require, 'lualine') then
       require('lualine').refresh()
     end

     vim.notify('Transparency refreshed', vim.log.levels.INFO)
   end, {})

   vim.api.nvim_create_user_command('CheckTransparency', function()
     local hl = vim.api.nvim_get_hl(0, { name = "lualine_c_normal" })
     vim.notify('lualine_c_normal bg: ' .. (hl.bg or "nil"), vim.log.levels.INFO)

     hl = vim.api.nvim_get_hl(0, { name = "BufferLineBufferSelected" })
     vim.notify('BufferLineBufferSelected bg: ' .. (hl.bg or "nil"), vim.log.levels.INFO)
   end, {})

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
