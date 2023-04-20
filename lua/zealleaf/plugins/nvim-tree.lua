-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- configure nvim-tree
nvimtree.setup({
	-- change folder arrow icons
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	-- disable window_picker for
	-- explorer to work well with
	-- window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
			quit_on_open = true,
		},
	},
	view = {
		side = "right",
		width = 66,
		mappings = {
			custom_only = true,
			list = {
				-- Ignore
				{ key = "s", action = "" },
				-- 打开or 编辑文件
				{ key = "so", action = "system_open" },
				{ key = { "o", "<2-LeftMouse>" }, action = "edit" },
				{ key = "<CR>", action = "edit" },
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
			},
		},
	},
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
