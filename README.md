# nvim-filetype

[English](README.md) | [中文](README_zh.md)

A fast and convenient Neovim plugin for quickly changing the filetype of the current buffer.

**Requires Neovim >= 0.7**

## ✨ Features

- 🚀 Quick filetype switching with an interactive picker
- 📋 Pinned filetypes shown first, rest listed alphabetically
- 🎯 Visual indicator for the current filetype
- ⚙️ Simple, minimal configuration
- 🔍 Support for all Neovim filetypes

## 📦 Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

#### Zero-config (no `setup()` needed)

```lua
{
    "NewbieAndy/nvim-filetype",
    cmd = "FTSelect",
    keys = {
        { "<leader>ft", "<cmd>FTSelect<cr>", desc = "Select Filetype" },
    },
}
```

#### With custom configuration

```lua
{
    "NewbieAndy/nvim-filetype",
    cmd = "FTSelect",
    keys = {
        { "<leader>ft", "<cmd>FTSelect<cr>", desc = "Select Filetype" },
    },
    opts = {
        -- Commonly used filetypes, prioritized in the selection list
        filetypes = { "lua", "python", "javascript", "typescript" },
        -- Whether to show all available filetypes
        -- If false, only configured filetypes are shown
        show_all_filetypes = true,
        -- Icon displayed next to the current filetype
        selected_icon = "✓",
    },
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use { "NewbieAndy/nvim-filetype" }

-- Optional: customize with setup()
require("nvim-filetype").setup({
    filetypes = { "lua", "python", "javascript" },
    show_all_filetypes = true,
    selected_icon = "✓",
})
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'NewbieAndy/nvim-filetype'

" Optional: customize with setup() after plug#end()
lua << EOF
require("nvim-filetype").setup({
    filetypes = { "lua", "python", "javascript" },
    show_all_filetypes = true,
    selected_icon = "✓",
})
EOF
```

## ⚙️ Configuration

### Default Configuration

```lua
require("nvim-filetype").setup({
    -- Pinned filetypes always shown first, in the order listed
    filetypes = {},

    -- Show all available Neovim filetypes
    -- When true:  pinned first, then all others alphabetically
    -- When false: only pinned filetypes are shown
    show_all_filetypes = true,

    -- Icon displayed next to the currently active filetype
    selected_icon = "*",
})
```

### Configuration Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `filetypes` | `string[]` | `{}` | Pinned filetypes always shown first |
| `show_all_filetypes` | `boolean` | `true` | Show all Neovim filetypes, or only pinned ones |
| `selected_icon` | `string` | `"*"` | Icon shown next to the current filetype |

### Example Configurations

#### Pin your most-used filetypes

```lua
require("nvim-filetype").setup({
    filetypes = { "lua", "python", "javascript", "typescript" },
    selected_icon = "✓",
})
```

#### Only show specific filetypes

```lua
require("nvim-filetype").setup({
    filetypes = { "lua", "python", "javascript", "typescript", "go", "rust" },
    show_all_filetypes = false,
})
```

## 🚀 Usage

### Command

After installation, use the following command to open the filetype picker:

```vim
:FTSelect
```

### Recommended Keymapping

Add a keymapping for quick access:

```lua
vim.keymap.set("n", "<leader>ft", "<cmd>FTSelect<cr>", { desc = "Select Filetype" })
```

Or in Vimscript:

```vim
nnoremap <leader>ft :FTSelect<CR>
```

### Workflow

1. Open any buffer
2. Execute `:FTSelect` or use your keymapping
3. Type to filter filetypes (fuzzy matching supported if using a fuzzy picker)
4. Select the desired filetype
5. The buffer's filetype is immediately updated

The picker list order is: **pinned** (your `filetypes` config, in declared order) → **all others** alphabetically.

## 🎯 Use Cases

- **Quick Syntax Highlighting**: Change syntax highlighting without reopening files
- **Testing Syntax**: Test how code looks with different syntax highlighting
- **File Identification**: Help Neovim properly identify file types
- **Development Workflow**: Quickly switch between related filetypes (e.g., JavaScript ↔ TypeScript)

## 🔧 Troubleshooting

### Filetype Picker Not Showing Up

Ensure you have a UI picker installed. The plugin uses `vim.ui.select()`, which requires:
- A UI picker plugin like [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) with `telescope-ui-select.nvim`, or
- [dressing.nvim](https://github.com/stevearc/dressing.nvim) for enhanced UI

### Filetype Not Changing

Make sure the filetype you're selecting is valid. You can check available filetypes with:

```vim
:echo getcompletion('', 'filetype')
```

### Custom Filetypes Not Appearing

If you have custom filetypes defined in your configuration, ensure they are properly loaded before calling `:FTSelect`.

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Report bugs
- Suggest new features
- Submit pull requests

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

Thanks to all contributors and users of this plugin!
