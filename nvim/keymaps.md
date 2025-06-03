# Neovim Keymappings

This document lists all keymappings configured in this Neovim setup, organized by category.

**Note**: The leader key is set to `<Space>`.

## General Keybindings

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>q` | Normal | Quit current buffer |
| `<leader>Q` | Normal | Quit all buffers |
| `<leader>w` | Normal | Write (save) current buffer |
| `<leader>s` | Normal | Source current file |
| `jj` | Insert | Exit insert mode (alternative to Escape) |
| `<C-w>_` | Normal | Maximize height of Split |
| `<C-w> \|` | Normal | Maximize width of Split (ignore \ in keybinding) |
| `<C-w> =` | Normal | Equalize height and width Split |

## File Operations

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>pv` | Normal | Open file explorer (Ex) |
| `<leader>pf` | Normal | Find files with Telescope |
| `<leader>pt` | Normal | Open Telescope smart_open for file navigation |
| `<C-p>` | Normal | Find git files with Telescope |
| `<leader>n` | Normal | Toggle NeoTree file explorer |
| `<leader>u` | Normal | Toggle Undotree |

## Navigation

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<C-d>` | Normal | Scroll down half a page (centered) |
| `<C-u>` | Normal | Scroll up half a page (centered) |
| `n` | Normal | Find next search result (centered) |
| `N` | Normal | Find previous search result (centered) |
| `<Tab>` | Normal | Cycle to next buffer |
| `<S-Tab>` | Normal | Cycle to previous buffer |
| `<leader>1-9` | Normal | Go to buffer 1-9 |
| `<C-S-W>` | Normal | Close current buffer (force) |
| `<leader>fp` | Normal | Open Project Explorer |

## Text Manipulation

| Keybinding | Mode | Description |
|------------|------|-------------|
| `x` | Normal, Visual | Delete character without yanking |
| `s` | Normal, Visual | Substitute character without yanking |
| `<leader>y` | Normal, Visual | Yank to system clipboard |
| `<leader>Y` | Normal | Yank line to system clipboard |
| `J` | Visual | Move selected line down |
| `K` | Visual | Move selected line up |
| `<leader>rn` | Normal | Rename variable or symbol using LSP |
| `<C-S-V>` | All | Paste from system clipboard |

## Development Specific

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>r` | Normal | Save and run JavaScript/Node.js file |
| `<leader>t` | Normal | Compile and run TypeScript file |
| `<C-e>` | Normal | Emmet leader key for HTML expansion |
| `<leader>md` | Normal | Toggle Markdown Preview |
| `<leader>go` | Normal | Use go run on Go file |
| `<leader>ft` | Normal | Toggle Floating Terminal |
| `<leader>gd` | Normal | Search in Go Docs |

## Plugin Specific

### LSP Keybindings

| Keybinding | Mode | Description |
|------------|------|-------------|
| `K` | Normal | Show hover documentation |
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gi` | Normal | Go to implementation |
| `go` | Normal | Go to type definition |
| `gr` | Normal | Show references |
| `gs` | Normal | Show signature help |
| `<leader>rn` | Normal | Rename symbol |
| `<leader>ca` | Normal, Visual | Code actions |
| `<leader>f` | Normal | Format buffer |

### Telescope

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>?` | Normal | Find recently opened files |
| `<leader><space>` | Normal | Find existing buffers |
| `<leader>/` | Normal | Fuzzy search in current buffer |
| `<leader>ps` | Normal | Grep search with custom input |
| `<leader>gf` | Normal | Search Git files |
| `<leader>sf` | Normal | Search files |
| `<leader>sh` | Normal | Search help tags |
| `<leader>sw` | Normal | Search current word |
| `<leader>sg` | Normal | Search by grep (live grep) |
| `<leader>sd` | Normal | Search diagnostics |
| `<leader>sr` | Normal | Resume last search |
| `<leader>sb` | Normal | Fuzzy find in current buffer |

### Harpoon

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>a` | Normal | Add file to Harpoon |
| `<C-e>` | Normal | Toggle Harpoon quick menu |
| `<A-1>` | Normal | Navigate to Harpoon file 1 |
| `<A-2>` | Normal | Navigate to Harpoon file 2 |
| `<A-3>` | Normal | Navigate to Harpoon file 3 |
| `<A-4>` | Normal | Navigate to Harpoon file 4 |

### Git

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>gs` | Normal | Open Git status (Fugitive) |

### Trouble (Diagnostics)

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>xx` | Normal | Toggle Trouble |
| `<leader>xw` | Normal | Toggle workspace diagnostics |
| `<leader>xd` | Normal | Toggle document diagnostics |
| `<leader>xq` | Normal | Toggle quickfix list |
| `<leader>xl` | Normal | Toggle location list |
| `gR` | Normal | Toggle LSP references |

### Zen Mode

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>zz` | Normal | Toggle Zen Mode for focused writing |

### Neovide Specific

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<C-=>` | Normal, Visual | Zoom in (Neovide only) |
| `<C-->` | Normal, Visual | Zoom out (Neovide only) |
