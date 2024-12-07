# Introduction
The nvim-filetype plugin allows you to quickly change or set the filetype of the current buffer.

# Installation
To install using lazy.nvim, add the following to your configuration:

## [Lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
return {
    "NewbieAndy/nvim-filetype",
opts = {
  -- Commonly used filetypes, prioritized in the selection queue. Default is empty.
  filetypes = {"json", "python", "java"},
  -- Whether to show all filetypes. If false, only configured filetypes are shown. Default is true.
  show_all_filetypes = true,
  -- Icon for the selected filetype. Default is '*'.
  selected_icon = '*',
    }
}
```

## Command
To start the plugin, use the command:
```
:FTSelect
```