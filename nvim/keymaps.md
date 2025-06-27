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
| `jk` | Insert | Exit insert mode (alternative to Escape) |
| `<C-w>_` | Normal | Maximize height of Split |
| `<C-w>\|` | Normal | Maximize width of Split |
| `<C-w> =` | Normal | Equalize height and width of Splits |
| `<C-S-W>` | Normal | Close current buffer (force) |

## File Operations

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>pv` | Normal | Open file explorer (Netrw) |
| `<leader>pf` | Normal | Find files with Telescope |
| `<leader>pt` | Normal | Open Telescope smart_open for file navigation |
| `<C-p>` | Normal | Find git files with Telescope |
| `<leader>n` | Normal | Toggle NeoTree file explorer |
| `<leader>u` | Normal | Toggle Undotree |
| `<leader>fp` | Normal | Open Project Explorer |

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

## Text Manipulation

| Keybinding | Mode | Description |
|------------|------|-------------|
| `x` | Normal, Visual | Delete character without yanking |
| `s` | Normal, Visual | Substitute character without yanking |
| `<leader>y` | Normal, Visual | Yank to system clipboard |
| `<leader>Y` | Normal | Yank line to system clipboard |
| `J` | Visual | Move selected line down |
| `K` | Visual | Move selected line up |
| `<leader>rn` | Normal | Rename variable or symbol using IncRename |
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
| `gr` | Normal | Show references |
| `<C-S-k>` | Normal | Show signature help |
| `<leader>f` | Normal | Format buffer |
| `[d` | Normal | Go to previous diagnostic |
| `]d` | Normal | Go to next diagnostic |

### Telescope

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>pf` | Normal | Find files |
| `<C-p>` | Normal | Find git files |
| `<leader>ps` | Normal | Grep search with custom input |
| `<leader>pt` | Normal | Open Telescope smart_open for file navigation |

### Harpoon

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>a` | Normal | Add file to Harpoon |
| `<leader>h` | Normal | Toggle Harpoon quick menu |
| `<C-j>` | Normal | Navigate to Harpoon file 1 |
| `<C-k>` | Normal | Navigate to Harpoon file 2 |
| `<C-l>` | Normal | Navigate to Harpoon file 3 |
| `<C-;>` | Normal | Navigate to Harpoon file 4 |

### Git

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>gs` | Normal | Open Git status (Fugitive) |

### Zen Mode

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>zz` | Normal | Toggle Zen Mode for focused writing |

### Floaterm

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>ft` | Normal | Toggle Floaterm |
| `<C-Space>` | Terminal | Toggle Floaterm |
| `<leader>go` | Normal | Run go run in a new Floaterm |
| `<leader>f1` | Normal | Toggle named Floaterm "term1" |
| `<leader>f2` | Normal | Toggle named Floaterm "term2" with yazi |
| `<leader>f3` | Normal | Toggle named Floaterm "term3" with lazygit |

### Doing.nvim

| Keybinding | Mode | Description |
|------------|------|-------------|
| `<leader>da` | Normal | Add a new task |
| `<leader>de` | Normal | Edit tasks |
| `<leader>dn` | Normal | Mark a task as done |
| `<leader>dt` | Normal | Toggle a task's status |
| `<leader>ds` | Normal | Show the status of all tasks |
