# Neovim Configuration

A modern, keyboard-driven Neovim setup optimized for Ruby/Rails development with strong LSP support and a clean UI.

## Features

- **LSP-First Development** - Native LSP with ruby-lsp, solargraph, and more
- **Code Quality** - Format on save (Conform) + Linting (nvim-lint)
- **Fast Navigation** - Telescope, Harpoon, Flash, Oil.nvim
- **Git Integration** - Fugitive, Gitsigns with inline blame
- **Beautiful UI** - Catppuccin theme, Lualine, Noice, transparent backgrounds
- **Testing** - vim-test integration for running specs

## Requirements

- Neovim >= 0.9.0
- Git
- Node.js (for some LSP servers)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (for Telescope live grep)
- [fd](https://github.com/sharkdp/fd) (optional, faster file finding)
- [the_silver_searcher](https://github.com/ggreer/the_silver_searcher) (for ag extension)

## Installation

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this repository
git clone https://github.com/YOUR_USERNAME/nvim_config ~/.config/nvim

# Start Neovim (plugins will auto-install)
nvim
```

### LSP Servers

Install language servers manually via `:Mason`:

| Server | Language | Install Command |
|--------|----------|-----------------|
| ruby-lsp | Ruby | `:MasonInstall ruby-lsp` |
| solargraph | Ruby | `:MasonInstall solargraph` |
| lua_ls | Lua | `:MasonInstall lua-language-server` |
| tsserver | TypeScript/JS | `:MasonInstall typescript-language-server` |
| gopls | Go | `:MasonInstall gopls` |

## Directory Structure

```
~/.config/nvim/
├── init.lua                    # Entry point, leader key, Lazy setup
├── lazy-lock.json              # Locked plugin versions
├── lua/
│   ├── options.lua             # Editor settings (tabs, search, appearance)
│   ├── keymapping.lua          # Global keybindings
│   ├── colorscheme.lua         # Theme configuration
│   ├── error-handling.lua      # Startup error suppression
│   │
│   ├── # Configuration modules
│   ├── lualine-config.lua      # Status line customization
│   ├── noice-config.lua        # Command line UI
│   ├── notify-config.lua       # Notification settings
│   ├── harpoon-config.lua      # Quick file navigation
│   ├── beacon-config.lua       # Cursor jump highlighting
│   ├── focus-config.lua        # Window focus management
│   ├── scrollview-config.lua   # Scroll position indicator
│   │
│   ├── util/
│   │   └── keymapper.lua       # Keymapping helper utility
│   │
│   └── plugins/                # Plugin specifications
│       ├── lsp-setup.lua       # LSP configuration
│       ├── cmp.lua             # Autocompletion
│       ├── conform.lua         # Code formatting
│       ├── nvim-lint.lua       # Linting
│       ├── treesitter.lua      # Syntax highlighting
│       ├── telescope.lua       # Fuzzy finder
│       └── ...
```

## Keymap Reference

**Leader Key:** `\` (backslash) or `<Space>`

### General

| Key | Mode | Action |
|-----|------|--------|
| `jk` | Insert | Exit insert mode |
| `U` | Normal | Redo (remapped from `<C-r>`) |
| `<Esc>` | Terminal | Exit terminal mode |
| `<leader>q` | Normal | Close all buffers |
| `<leader>e` | Normal | Toggle floating terminal |

### Window Navigation

| Key | Mode | Action |
|-----|------|--------|
| `<C-h>` | Normal | Move to left window |
| `<C-j>` | Normal | Move to down window |
| `<C-k>` | Normal | Move to up window |
| `<C-l>` | Normal | Move to right window |

### File Navigation (Telescope)

| Key | Action |
|-----|--------|
| `<C-p>` | Find files |
| `<leader>b` | List buffers |
| `<leader>g` | Git files |
| `<leader>h` | Live grep (search in files) |
| `<leader>r` | Treesitter symbols |
| `<leader>/` | Fuzzy search in current buffer |
| `<leader>cc` | Switch colorscheme |
| `<leader>nt` | Tmuxinator projects |
| `<Space>t` | File browser |

### File Explorer (Oil.nvim)

| Key | Action |
|-----|--------|
| `<leader>no` | Open Oil file explorer |
| `<leader>nf` | Oil in current file's directory |

### Harpoon (Quick Navigation)

| Key | Action |
|-----|--------|
| `<leader>na` | Add file to Harpoon |
| `<leader>nl` | Open Harpoon quick menu |

### Code Actions

| Key | Action |
|-----|--------|
| `<leader>cf` | Format code |
| `<leader>cs` | Toggle symbols outline (Aerial) |
| `<leader>cr` | Find references |
| `<leader>cd` | Go to definition |
| `<leader>cl` | Trigger linting |
| `<leader>ng` | Generate code annotations (Neogen) |

### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Hover documentation |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `[d` / `]d` | Previous/next diagnostic |

### Git (Gitsigns)

| Key | Action |
|-----|--------|
| `]h` / `[h` | Next/previous hunk |
| `<leader>ghs` | Stage hunk |
| `<leader>ghr` | Reset hunk |
| `<leader>ghS` | Stage buffer |
| `<leader>ghu` | Undo stage hunk |
| `<leader>ghR` | Reset buffer |
| `<leader>ghp` | Preview hunk inline |
| `<leader>ghb` | Blame line |
| `<leader>ghd` | Diff this |

### Testing (vim-test)

| Key | Action |
|-----|--------|
| `<leader>st` | Test current file |
| `<leader>ss` | Test nearest |
| `<leader>sl` | Test last |
| `<leader>sa` | Test suite |

### Search & Replace (Spectre)

| Key | Action |
|-----|--------|
| `<leader>sr` | Search/Replace in project |
| `<leader>sw` | Search word under cursor |
| `<leader>sp` | Search in current file |

### TODO Comments

| Key | Action |
|-----|--------|
| `]t` / `[t` | Next/prev TODO |
| `<leader>xt` | TODO list (Telescope) |
| `<leader>xT` | TODO/FIX/FIXME only |
| `<leader>xq` | TODO quickfix |

### Folding (nvim-ufo)

| Key | Action |
|-----|--------|
| `zR` | Open all folds |
| `zM` | Close all folds |
| `zr` | Open folds except kinds |
| `zm` | Close folds with level |
| `zK` | Peek fold or hover |

### Focus & Zen

| Key | Action |
|-----|--------|
| `<leader>z` | Toggle Zen mode |
| `<leader>tw` | Toggle Twilight (dim inactive) |

### Command Palette (Legendary)

| Key | Action |
|-----|--------|
| `<leader>p` | Command palette |
| `<leader>pk` | Search keymaps |
| `<leader>pc` | Search commands |
| `<leader>pf` | Search functions |

### Terminal (toggleterm)

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle terminal |
| `<leader>tf` | Float terminal |
| `<leader>th` | Horizontal terminal |
| `<leader>tv` | Vertical terminal |
| `<leader>tg` | Lazygit |

### Text Objects (Treesitter)

| Key | Action |
|-----|--------|
| `af` / `if` | Around/inside function |
| `ac` / `ic` | Around/inside class |
| `aa` / `ia` | Around/inside argument |
| `]f` / `[f` | Next/previous function |
| `]c` / `[c` | Next/previous class |
| `<C-space>` | Expand selection |
| `<BS>` | Shrink selection |

### Flash (Motion)

| Key | Action |
|-----|--------|
| `<leader>f` | Flash jump |

### Surround (nvim-surround)

| Key | Action |
|-----|--------|
| `ys{motion}{char}` | Add surround (e.g., `ysiw"` wraps word in quotes) |
| `ds{char}` | Delete surround (e.g., `ds"` removes quotes) |
| `cs{old}{new}` | Change surround (e.g., `cs"'` changes `"` to `'`) |
| `yss{char}` | Surround entire line |
| `S{char}` | Surround selection (visual mode) |

**Ruby-specific surrounds:**
- `#` - Ruby interpolation `#{...}`
- `=` - ERB output `<%= ... %>`
- `-` - ERB code `<% ... %>`

## Installed Plugins (70+ total)

### Core LSP & Completion
- **nvim-lspconfig** - LSP client configuration
- **mason.nvim** - LSP/DAP/linter/formatter installer
- **nvim-cmp** - Autocompletion engine
- **LuaSnip** - Snippet engine
- **cmp-nvim-lsp** - LSP completion source
- **cmp-buffer** - Buffer completion source
- **cmp-path** - Path completion source

### Code Quality
- **conform.nvim** - Code formatting (stylua, black, prettier, rubocop, gofmt, rustfmt)
- **nvim-lint** - Asynchronous linting (rubocop)
- **aerial.nvim** - Code outline/symbols

### Syntax & Treesitter
- **nvim-treesitter** - AST-based syntax highlighting
- **nvim-treesitter-textobjects** - Smart text objects

### Navigation
- **telescope.nvim** - Fuzzy finder
- **telescope-fzf-native.nvim** - FZF sorter for Telescope
- **telescope-ag** - Silver searcher integration
- **telescope-file-browser.nvim** - File browser extension
- **oil.nvim** - File explorer as buffer
- **flash.nvim** - Enhanced motion
- **harpoon** - Quick file navigation

### Git
- **vim-fugitive** - Git commands
- **vim-rhubarb** - GitHub integration
- **gitsigns.nvim** - Git signs in gutter

### Productivity
- **neogen** - Documentation generator
- **which-key.nvim** - Keymap discovery
- **legendary.nvim** - Command palette with frecency sorting
- **nvim-spectre** - Project-wide search and replace
- **todo-comments.nvim** - Highlight and search TODO/FIXME/HACK

### Editing
- **mini.nvim** - Collection: ai, surround, splitjoin, comment, move
- **nvim-surround** - Modern Lua surround with Ruby support
- **vim-surround** - Classic surround (fallback)
- **vim-commentary** - Comment/uncomment
- **vim-endwise** - Auto-close blocks
- **nvim-ufo** - Modern treesitter-aware code folding

### UI & Appearance
- **lualine.nvim** - Status line
- **catppuccin** - Color scheme (active)
- **tokyonight.nvim** - Alternative theme
- **nightfox.nvim** - Alternative theme
- **transparent.nvim** - Background transparency
- **indent-blankline.nvim** - Indent guides
- **smartcolumn.nvim** - Smart color column
- **beacon.nvim** - Cursor jump highlight
- **rainbow** - Rainbow brackets
- **scrollview.nvim** - Scroll indicator
- **noice.nvim** - Modern command line UI
- **nvim-notify** - Notification system
- **focus.nvim** - Window focus management
- **zen-mode.nvim** - Distraction-free writing
- **twilight.nvim** - Dim inactive code

### Ruby/Rails
- **vim-rails** - Rails commands
- **vim-bundler** - Bundler integration
- **vim-ruby** - Enhanced Ruby syntax & indentation
- **nvim-ruby-lsp** - Additional Ruby LSP features

### Testing
- **vim-test** - Test runner with support for multiple frameworks

### Utilities
- **toggleterm.nvim** - Terminal management with lazygit integration
- **vim-eunuch** - Unix commands
- **vim-sensible** - Sensible defaults
- **plenary.nvim** - Lua utilities
- **nui.nvim** - UI components
- **nvim-web-devicons** - File icons
- **image.nvim** - Image rendering
- **diagram.nvim** - Diagram rendering (Mermaid, PlantUML, D2)

## Editor Options

| Setting | Value | Description |
|---------|-------|-------------|
| Tab width | 2 spaces | Soft tabs, smart indent |
| Line numbers | Relative | Easier motion counting |
| Color column | 80 | Line length indicator |
| Search | Smart case | Case-insensitive unless uppercase |
| Scroll offset | 10 lines | Keep context when scrolling |
| Mouse | Disabled | Keyboard-only workflow |
| Clipboard | System | Uses unnamedplus |
| Swap files | Disabled | Uses undofile instead |

## Themes

Available colorschemes (switch with `<leader>cc`):

- **catppuccin-macchiato** (default) - Warm, cozy palette
- **tokyonight** - Cool blue tones
- **nightfox** - Dark with good contrast
- **nightvision** - High contrast dark
- **greenvision** - Matrix-style green

---

# Future Plugin Ideas

Plugins to consider adding later:

| Plugin | Purpose | Keymaps |
|--------|---------|---------|
| **nvim-autopairs** | Auto-close brackets/quotes | Automatic |
| **trouble.nvim** | Pretty diagnostics list | `<leader>xx` |
| **persistence.nvim** | Session management | `<leader>qs` |
| **nvim-dap** | Debugging with breakpoints | `<leader>db/dc/di` |
| **diffview.nvim** | Git diff viewer | `<leader>gd` |
| **project.nvim** | Project management | `<leader>fp` |
| **nvim-tree.lua** | File tree sidebar | `<leader>nn` |
| **octo.nvim** | GitHub issues/PRs | `<leader>oi/op` |
| **markdown-preview.nvim** | Live markdown preview | `<leader>mp` |
| **vim-illuminate** | Highlight word under cursor | Automatic |
| **indent-o-matic** | Auto-detect indentation | Automatic |
| **nvim-colorizer.lua** | Color code highlighting | Automatic |

---

## Switching Back to vim-floaterm

If you prefer vim-floaterm over toggleterm:

1. Edit `lua/plugins/floatterm.lua` - uncomment the plugin
2. Remove or comment out `lua/plugins/toggleterm.lua`

---

## Known Issues

1. **Duplicate LSP config:** Both `lsp.lua` and `lsp-setup.lua` configure servers. Consider consolidating into one file.

## License

MIT License - see [LICENSE](LICENSE)
