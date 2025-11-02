# nvim-filetype

[English](README.md) | [中文](README_zh.md)

A fast and convenient Neovim plugin for quickly changing the filetype of the current buffer.

## ✨ Features

- 🚀 Quick filetype switching with an interactive picker
- 📋 Prioritize frequently used filetypes
- 🎯 Visual indicator for the current filetype
- ⚙️ Flexible configuration options
- 🔍 Support for all Neovim filetypes

## 📦 Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    "NewbieAndy/nvim-filetype",
    config = function()
        require("nvim-filetype").setup({
            -- Commonly used filetypes, prioritized in the selection list
            filetypes = { "lua", "python", "javascript", "typescript" },
            -- Whether to show all available filetypes
            -- If false, only configured filetypes are shown
            show_all_filetypes = true,
            -- Icon displayed next to the current filetype
            selected_icon = "✓",
        })
    end,
    keys = {
        { "<leader>ft", "<cmd>FTSelect<cr>", desc = "Select Filetype" },
    },
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
    "NewbieAndy/nvim-filetype",
    config = function()
        require("nvim-filetype").setup({
            filetypes = { "lua", "python", "javascript" },
            show_all_filetypes = true,
            selected_icon = "✓",
        })
    end
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'NewbieAndy/nvim-filetype'

" After plug#end(), add:
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
    -- List of commonly used filetypes (displayed first in the picker)
    filetypes = {},
    
    -- Show all available filetypes in Neovim
    -- When true: shows configured filetypes first, then all others
    -- When false: shows only configured filetypes
    show_all_filetypes = true,
    
    -- Icon displayed next to the currently selected filetype
    selected_icon = "*",
})
```

### Configuration Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `filetypes` | `string[]` | `{}` | List of commonly used filetypes to prioritize in the picker |
| `show_all_filetypes` | `boolean` | `true` | Whether to show all available filetypes or only configured ones |
| `selected_icon` | `string` | `"*"` | Icon displayed next to the current filetype |

### Example Configurations

#### Minimal Setup (Show All Filetypes)

```lua
require("nvim-filetype").setup()
```

#### Custom Prioritized Filetypes

```lua
require("nvim-filetype").setup({
    filetypes = { "markdown", "json", "yaml", "lua", "python" },
    selected_icon = "→",
})
```

#### Only Show Specific Filetypes

```lua
require("nvim-filetype").setup({
    filetypes = { "lua", "python", "javascript", "typescript", "go", "rust" },
    show_all_filetypes = false,  -- Only show configured filetypes
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
