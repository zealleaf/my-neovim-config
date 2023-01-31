-- 基础配置
require("zealleaf.core.options")

-- 键盘映射
require("zealleaf.core.keymaps-base")
require("zealleaf.core.keymaps-plugin")

-- 主题设置
require("zealleaf.core.colorscheme")
-- require("zealleaf.plugins.neosolarized")
-- require("zealleaf.plugins.onedark")

-- LSP
require("zealleaf.plugins.lsp.lspcolors")
require("zealleaf.plugins.lsp.lspconfig")
require("zealleaf.plugins.lsp.lspkind")
require("zealleaf.plugins.lsp.lspsaga")
require("zealleaf.plugins.lsp.mason")
require("zealleaf.plugins.lsp.null-ls")

-- 插件配置
---- 自定义配置
require("zealleaf.plugins-setup")
require("zealleaf.plugins.comment")
require("zealleaf.plugins.nvim-tree")
require("zealleaf.plugins.lualine")
require("zealleaf.plugins.telescope")
require("zealleaf.plugins.nvim-cmp")
require("zealleaf.plugins.autopairs")
require("zealleaf.plugins.treesitter")
require("zealleaf.plugins.gitsigns")
require("zealleaf.plugins.bufferline")
require("zealleaf.plugins.wilder")
require("zealleaf.plugins.dashboard")
require("zealleaf.plugins.project")
require("zealleaf.plugins.toggleterm")
require("zealleaf.plugins.colorizer")
require("zealleaf.plugins.symbols-outline")
require("zealleaf.plugins.git")
require("zealleaf.plugins.gitsigns")
