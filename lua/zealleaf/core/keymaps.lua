-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local opt = {
	noremap = true,
	silent = true,
}

---------------------
-- General Keymaps
---------------------
keymap.set("n", "<leader>w", ":w<CR>", opt)
keymap.set("n", "<leader>wq", ":wqa!<CR>", opt)
keymap.set("n", "qq", ":q!<CR>", opt)
keymap.set("n", "<leader>q", ":qa!<CR>", opt)

-- use jk to exit insert mode
keymap.set("n", "J", "", opt)
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")
keymap.set("n", "J", "5j")
keymap.set("n", "K", "5k")
-- 上下移动选中文本
keymap.set("v", "[", ":move '<-2<CR>gv-gv", opt)
keymap.set("v", "/", ":move '>+1<CR>gv-gv", opt)
keymap.set("v", "J", "5j")
keymap.set("v", "K", "5k")
keymap.set("v", "H", "^")
keymap.set("v", "L", "$")

-- clear search highlights
keymap.set("n", "<C-n>", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
-- 取消 s 默认功能
keymap.set("n", "s", "", opt)
keymap.set("n", "sh", ":vsp<CR>", opt)
keymap.set("n", "sv", ":sp<CR>", opt)
keymap.set("n", "sx", "<C-w>c", opt)
keymap.set("n", "so", "<C-w>o", opt) -- close others
keymap.set("n", "s;", ":vertical resize +10<CR>", opt)
keymap.set("n", "s'", ":vertical resize -10<CR>", opt)
keymap.set("n", "s[", ":resize +10<CR>", opt)
keymap.set("n", "s/", ":resize -10<CR>", opt)
keymap.set("n", "s=", "<C-w>=", opt)
----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
-- hop
keymap.set("n", "<leader>hp", ":HopPattern<CR>")
keymap.set("n", "<leader>hw", ":HopWord<CR>")
-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("v", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- bufferline
-- 左右Tab切换
keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opt)
keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", opt)
keymap.set("n", "<leader>bp", ":BufferLinePick<CR>", opt)
keymap.set("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)
keymap.set("n", "<leader>br", ":BufferLineCloseRight<CR>", opt)
keymap.set("n", "<leader>bl", ":BufferLineCloseLeft<CR>", opt)
keymap.set("n", "<C-w>", ":Bdelete!<CR>", opt)

-- search and replace
keymap.set("n", "<leader>sr", ":lua require('spectre').open()<CR>")
keymap.set("v", "<leader>sr", ":lua require('spectre').open_visual({select_word=true})")
keymap.set("n", "<leader>src", ":lua require('spectre').open_file_search()")

-- outline
keymap.set("n", "<leader>so", ":SymbolsOutline<CR>")

-- 插件列表快捷键
local pluginKeys = {}

pluginKeys.nvimTreeList = { -- 打开文件或文件夹
	-- Ignore
	{ key = "s", action = "" },
	-- 打开or 编辑文件
	{ key = { "o", "<2-LeftMouse>" }, action = "edit" },
	{ key = "so", action = "system_open" },
	{ key = "<CR>", action = "open" },
	-- 垂直分屏打开文件, 用水平线分割
	{ key = "sh", action = "vsplit" },
	-- 水平分屏打开文件, 用垂线分割
	{ key = "sv", action = "split" },
	-- Ignore (node_modules)
	{ key = "i", action = "toggle_ignored" },
	-- Hide (dotfiles)
	{ key = ".", action = "toggle_dotfiles" },
	{ key = "R", action = "refresh" },
	-- 文件操作
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "cn", action = "copy_name" },
	{ key = "cp", action = "copy_path" },
	{ key = "cap", action = "copy_absolute_path" },
	{ key = "I", action = "toggle_file_info" },
	{ key = "n", action = "tabnew" },
	-- 进入下一级
	{ key = { "]" }, action = "cd" },
	-- 进入上一级
	{ key = { "[" }, action = "dir_up" },
	-- 折叠or 打开文件
	{ key = { "zc" }, action = "collapse_all" },
	{ key = { "zo" }, action = "expand_all" },
}
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
	i = {
		-- 上下移动
		["<C-j>"] = "move_selection_next",
		["<C-k>"] = "move_selection_previous",
		["<C-n>"] = "move_selection_next",
		["<C-p>"] = "move_selection_previous",
		-- 历史记录
		["<Down>"] = "cycle_history_next",
		["<Up>"] = "cycle_history_prev",
		-- 关闭窗口
		["<C-x>"] = "close",
		-- 预览窗口上下滚动
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
}

pluginKeys.mapToggleTerm = function(toggleterm)
	keymap.set({ "n", "t" }, "<leader>tf", toggleterm.toggleA)
	keymap.set({ "n", "t" }, "<leader>tl", toggleterm.toggleB)
	keymap.set({ "n", "t" }, "<leader>tb", toggleterm.toggleC)
	keymap.set({ "n", "t" }, "<leader>tg", toggleterm.toggleG)
end

return pluginKeys
