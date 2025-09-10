local theme_switcher = require('xddinside.theme-switcher')

 function ColorMyPencils(color)
   -- Load saved theme or use default
   color = color or theme_switcher.load_saved_theme()
   vim.cmd.colorscheme(color)

   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

   -- Apply theme integrations (bufferline, lualine, floaterm)
   local integrations = require('xddinside.theme-integrations')
   integrations.apply_theme_integrations(color)

   -- CRITICAL: Ensure lualine_c is ALWAYS transparent immediately
   vim.api.nvim_set_hl(0, "lualine_c_normal", { bg = "none" })
   vim.api.nvim_set_hl(0, "lualine_c_insert", { bg = "none" })
   vim.api.nvim_set_hl(0, "lualine_c_visual", { bg = "none" })
   vim.api.nvim_set_hl(0, "lualine_c_replace", { bg = "none" })
   vim.api.nvim_set_hl(0, "lualine_c_command", { bg = "none" })
   vim.api.nvim_set_hl(0, "lualine_c_inactive", { bg = "none" })

   -- Additional safeguard with delay
   vim.defer_fn(function()
     vim.api.nvim_set_hl(0, "lualine_c_normal", { bg = "none" })
     vim.api.nvim_set_hl(0, "lualine_c_insert", { bg = "none" })
     vim.api.nvim_set_hl(0, "lualine_c_visual", { bg = "none" })
     vim.api.nvim_set_hl(0, "lualine_c_replace", { bg = "none" })
     vim.api.nvim_set_hl(0, "lualine_c_command", { bg = "none" })
     vim.api.nvim_set_hl(0, "lualine_c_inactive", { bg = "none" })
   end, 200)

   -- Ensure transparent background on fullscreen toggle
   vim.api.nvim_create_autocmd("VimEnter", {
     pattern = "*",
     callback = function()
       vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
       vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
       -- Ensure lualine section c stays transparent
       vim.api.nvim_set_hl(0, "lualine_c_normal", { bg = "none" })
       vim.api.nvim_set_hl(0, "lualine_c_insert", { bg = "none" })
       vim.api.nvim_set_hl(0, "lualine_c_visual", { bg = "none" })
       vim.api.nvim_set_hl(0, "lualine_c_replace", { bg = "none" })
       vim.api.nvim_set_hl(0, "lualine_c_command", { bg = "none" })
       vim.api.nvim_set_hl(0, "lualine_c_inactive", { bg = "none" })

       -- Force bufferline transparency
       vim.cmd('redrawtabline')
     end,
   })

   -- Additional safeguard for lualine transparency
   vim.api.nvim_create_autocmd("ColorScheme", {
     pattern = "*",
     callback = function()
       vim.defer_fn(function()
         vim.api.nvim_set_hl(0, "lualine_c_normal", { bg = "none" })
         vim.api.nvim_set_hl(0, "lualine_c_insert", { bg = "none" })
         vim.api.nvim_set_hl(0, "lualine_c_visual", { bg = "none" })
         vim.api.nvim_set_hl(0, "lualine_c_replace", { bg = "none" })
         vim.api.nvim_set_hl(0, "lualine_c_command", { bg = "none" })
         vim.api.nvim_set_hl(0, "lualine_c_inactive", { bg = "none" })
       end, 50)
     end,
   })
 end

  -- ColorMyPencils() -- Disabled to avoid conflicts with init.lua theme loading