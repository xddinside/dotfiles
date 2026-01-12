# Lazy.nvim Migration Plan

## Overview

Migrate from Packer to lazy.nvim with:
- Modular plugin specs split by category
- Lazy-loading where appropriate
- Plugin-specific keymaps in each spec
- LSP config inlined into spec (idiomatic for lazy.nvim)

## Step 1: Create Lazy Bootstrap

**Create `lua/xddinside/lazy.lua`**
- Bootstrap lazy.nvim from GitHub
- Load specs from `lua/xddinside/plugins/`

## Step 2: Update Loader

**Edit `lua/xddinside/init.lua`**
- Replace `require("xddinside.packer")` → `require("xddinside.lazy")`
- Remove `require("xddinside.lsp-config")` (will be in lsp.lua spec)

## Step 3: Create Plugin Specs

**Key decisions made:**
- harpoon2 (upgraded from harpoon1) with custom keymaps: `<leader>a` add, `<leader>h` menu, homerow `<C-j/k/l/;>` nav, `<C-S-J>`/`<C-S-K>` prev/next
- smart-open: bound to `<leader>pt` (same as current remap.lua)
- Alpha buttons: use vim commands/lua functions (not telescope require)

| File | Plugins | Lazy Strategy |
|------|---------|---------------|
| `colorschemes.lua` | sonokai, vesper, rose-pine, catppuccin, nord, chai | `lazy=false` |
| `ui.lua` | lualine, bufferline, alpha, notify, devicons, indentmini | `lazy=false` |
| `navigation.lua` | telescope, smart-open, neo-tree, harpoon2, project-explorer | `keys`/`cmd` |
| `lsp.lua` | lspconfig, mason, mason-lspconfig, lspsaga, inc-rename, lspkind | `event=BufReadPre` |
| `completion.lua` | nvim-cmp, cmp-nvim-lsp, cmp-cmdline, luasnip, friendly-snippets, cmp_luasnip | `event=InsertEnter` |
| `treesitter.lua` | treesitter, playground, textobjects, autotag | `event=BufReadPost` |
| `editing.lua` | autoclose, emmet | `event=InsertEnter` |
| `git.lua` | fugitive | `cmd=Git` |
| `terminal.lua` | floaterm | `keys` |
| `markdown.lua` | render-markdown, markdown-preview | `ft=markdown` |
| `utils.lua` | undotree, doing, vim-be-good, colortils, godoc | `cmd`/`keys` |
| `zen.lua` | zen-mode | `keys` |
| `disabled.lua` | noice, multicursor | `enabled=false` |
| `neovide.lua` | Neovide-specific settings | `cond=vim.g.neovide` |

## Step 4: Migrate Keymaps

Move plugin-specific keymaps from `remap.lua` and `after/plugin/` into each plugin's `keys` spec:

| Spec | Keymaps to Move | Source |
|------|-----------------|--------|
| bufferline | `Tab`/`S-Tab` cycle, `<leader>1-9` go-to | after/plugin/bufferline.lua |
| telescope | `<leader>pf`, `<C-p>`, `<leader>ps` | after/plugin/telescope.lua |
| harpoon2 | `<leader>a` add, `<leader>h` menu, `<C-j/k/l/;>` nav 1-4, `<C-S-J>`/`<C-S-K>` prev/next | after/plugin/harpoon.lua |
| undotree | `<leader>u` | after/plugin/undotree.lua |
| fugitive | `<leader>gs` | after/plugin/fugitive.lua |
| zen-mode | `<leader>zz` | after/plugin/zenmode.lua |
| floaterm | `<leader>ft`, `<leader>f1-3`, `<leader>go/gr` | after/plugin/floaterm.lua |
| neo-tree | `<leader>n` | remap.lua |
| project-explorer | `<leader>fp` | after/plugin/project-explorer.lua |
| doing | `<leader>da/de/dn/dt/ds` | after/plugin/doing.lua |
| inc-rename | `<leader>rn` | remap.lua |
| godoc | `<leader>gd` | remap.lua |
| markdown-preview | `<leader>md` | remap.lua |

**Keep in remap.lua (global keymaps):**
- `<leader>pv` (netrw), `<leader>th` (theme), `v J/K` move lines, `<C-d/u>`, `n/N` search + center
- `<leader>y/Y` yank to clipboard, `<leader>s` source file, `<leader>q/Q` quit, `<leader>w` write
- `jk` (insert) escape, `x/s` delete to black hole, `<C-e>` emmet leader
- `<leader>r` run node %, `<leader>t` compile TS + run

**Alpha buttons (lua function calls):**
- `new` → `:enew<CR>`
- `find` → `<leader>pf`
- `recent` → `Telescope recent_files`
- `project` → `<leader>fp`
- `quit` → `:quit<CR>`

## Step 5: Cleanup

**Delete:**
- `lua/xddinside/packer.lua`
- `lua/xddinside/lsp-config.lua` (merged into lsp.lua)
- `after/plugin/` (entire directory - 24 files)
- `plugin/packer_compiled.lua`

**Keep unchanged:**
- `lua/xddinside/set.lua`
- `lua/xddinside/remap.lua` (global keymaps only)
- `lua/xddinside/theme-switcher.lua`

## File Changes Summary

| Action | Path |
|--------|------|
| CREATE | `lua/xddinside/lazy.lua` |
| CREATE | `lua/xddinside/plugins/` |
| CREATE | `lua/xddinside/plugins/colorschemes.lua` |
| CREATE | `lua/xddinside/plugins/ui.lua` |
| CREATE | `lua/xddinside/plugins/navigation.lua` |
| CREATE | `lua/xddinside/plugins/lsp.lua` |
| CREATE | `lua/xddinside/plugins/completion.lua` |
| CREATE | `lua/xddinside/plugins/treesitter.lua` |
| CREATE | `lua/xddinside/plugins/editing.lua` |
| CREATE | `lua/xddinside/plugins/git.lua` |
| CREATE | `lua/xddinside/plugins/terminal.lua` |
| CREATE | `lua/xddinside/plugins/markdown.lua` |
| CREATE | `lua/xddinside/plugins/utils.lua` |
| CREATE | `lua/xddinside/plugins/zen.lua` |
| CREATE | `lua/xddinside/plugins/disabled.lua` |
| CREATE | `lua/xddinside/plugins/neovide.lua` |
| EDIT | `lua/xddinside/init.lua` |
| EDIT | `lua/xddinside/remap.lua` (trim global keymaps only) |
| DELETE | `lua/xddinside/packer.lua` |
| DELETE | `lua/xddinside/lsp-config.lua` |
| DELETE | `after/plugin/*` (22 files) |
| DELETE | `plugin/packer_compiled.lua` |
| KEEP | `lua/xddinside/set.lua` |
| KEEP | `lua/xddinside/theme-switcher.lua` |

## Step 6: Test

1. Launch nvim
2. Run `:Lazy` - verify all plugins load
3. Run `:Lazy profile` - check load times
4. Test keymaps for each plugin
