# nvim-filetype

[English](README.md) | [中文](README_zh.md)

一个快速便捷的 Neovim 插件，用于快速更改当前缓冲区的文件类型。

**需要 Neovim >= 0.7**

## ✨ 特性

- 🚀 通过交互式选择器快速切换文件类型
- 📋 固定类型优先显示，其余按字母顺序排列
- 🎯 当前文件类型的可视化指示器
- ⚙️ 简洁、极简的配置
- 🔍 支持所有 Neovim 文件类型

## 📦 安装

### [lazy.nvim](https://github.com/folke/lazy.nvim)

#### 零配置（无需调用 `setup()`）

```lua
{
    "NewbieAndy/nvim-filetype",
    cmd = "FTSelect",
    keys = {
        { "<leader>ft", "<cmd>FTSelect<cr>", desc = "选择文件类型" },
    },
}
```

#### 自定义配置

```lua
{
    "NewbieAndy/nvim-filetype",
    cmd = "FTSelect",
    keys = {
        { "<leader>ft", "<cmd>FTSelect<cr>", desc = "选择文件类型" },
    },
    opts = {
        -- 常用的文件类型，在选择列表中优先显示
        filetypes = { "lua", "python", "javascript", "typescript" },
        -- 是否显示所有可用的文件类型
        -- 如果为 false，则只显示配置的文件类型
        show_all_filetypes = true,
        -- 当前文件类型旁边显示的图标
        selected_icon = "✓",
    },
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use { "NewbieAndy/nvim-filetype" }

-- 可选：使用 setup() 自定义配置
require("nvim-filetype").setup({
    filetypes = { "lua", "python", "javascript" },
    show_all_filetypes = true,
    selected_icon = "✓",
})
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'NewbieAndy/nvim-filetype'

" 可选：在 plug#end() 之后使用 setup() 自定义配置
lua << EOF
require("nvim-filetype").setup({
    filetypes = { "lua", "python", "javascript" },
    show_all_filetypes = true,
    selected_icon = "✓",
})
EOF
```

## ⚙️ 配置

### 默认配置

```lua
require("nvim-filetype").setup({
    -- 固定文件类型，始终排在列表最前面，按配置顺序显示
    filetypes = {},

    -- 显示 Neovim 中所有可用的文件类型
    -- 当为 true 时：固定类型在前，其余按字母顺序显示
    -- 当为 false 时：仅显示固定的文件类型
    show_all_filetypes = true,

    -- 当前文件类型旁边显示的图标
    selected_icon = "*",
})
```

### 配置选项

| 选项 | 类型 | 默认值 | 描述 |
|------|------|--------|------|
| `filetypes` | `string[]` | `{}` | 固定排在最前面的文件类型列表 |
| `show_all_filetypes` | `boolean` | `true` | 是否显示所有文件类型，或仅显示固定类型 |
| `selected_icon` | `string` | `"*"` | 当前文件类型旁边显示的图标 |

### 配置示例

#### 固定你的常用文件类型

```lua
require("nvim-filetype").setup({
    filetypes = { "lua", "python", "javascript", "typescript" },
    selected_icon = "✓",
})
```

#### 仅显示特定文件类型

```lua
require("nvim-filetype").setup({
    filetypes = { "lua", "python", "javascript", "typescript", "go", "rust" },
    show_all_filetypes = false,
})
```

## 🚀 使用方法

### 命令

安装后，使用以下命令打开文件类型选择器：

```vim
:FTSelect
```

### 推荐的键位映射

添加键位映射以便快速访问：

```lua
vim.keymap.set("n", "<leader>ft", "<cmd>FTSelect<cr>", { desc = "选择文件类型" })
```

或者使用 Vimscript：

```vim
nnoremap <leader>ft :FTSelect<CR>
```

### 工作流程

1. 打开任意缓冲区
2. 执行 `:FTSelect` 或使用你的键位映射
3. 输入以过滤文件类型（如果使用模糊选择器，支持模糊匹配）
4. 选择所需的文件类型
5. 缓冲区的文件类型立即更新

选择器列表顺序为：**固定类型**（你的 `filetypes` 配置，按声明顺序）→ **其余类型**（字母顺序）。

## 🎯 使用场景

- **快速语法高亮**：无需重新打开文件即可更改语法高亮
- **测试语法**：测试代码在不同语法高亮下的显示效果
- **文件识别**：帮助 Neovim 正确识别文件类型
- **开发工作流**：在相关文件类型之间快速切换（例如：JavaScript ↔ TypeScript）

## 🔧 故障排除

### 文件类型选择器未显示

确保你已安装 UI 选择器。该插件使用 `vim.ui.select()`，需要：
- UI 选择器插件，如 [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) 配合 `telescope-ui-select.nvim`，或
- [dressing.nvim](https://github.com/stevearc/dressing.nvim) 用于增强 UI

### 文件类型未更改

确保你选择的文件类型有效。你可以使用以下命令检查可用的文件类型：

```vim
:echo getcompletion('', 'filetype')
```

### 自定义文件类型未出现

如果你在配置中定义了自定义文件类型，请确保在调用 `:FTSelect` 之前已正确加载它们。

## 🤝 贡献

欢迎贡献！随时可以：
- 报告错误
- 提出新功能建议
- 提交拉取请求

## 📝 许可证

本项目采用 MIT 许可证 - 详见 [LICENSE](LICENSE) 文件。

## 🙏 致谢

感谢所有贡献者和使用本插件的用户！
