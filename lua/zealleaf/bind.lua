---------------------
-- preset
---------------------
vim.cmd("autocmd!")
vim.g.mapleader = ";"

local opt = {
	noremap = true,
	silent = true,
}

---------------------
-- General
---------------------
vim.keymap.set("n", "s", ":w!<CR>", opt)
vim.keymap.set("n", "ss", ":wa!<CR>", opt)
-- vim.keymap.set("n", "q", ":q!<CR>", opt)
-- vim.keymap.set("n", "qq", ":qa!<CR>", opt)
vim.keymap.set("n", "q", "<C-w>c", opt)
vim.keymap.set("n", "<C-q>", ":qa!<CR>", opt)
-- use <C-Spa> to exit insert mode
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "J", "5j")
vim.keymap.set("n", "K", "5k")
-- 上下移动选中文本
vim.keymap.set("v", "[", ":move '<-2<CR>gv-gv", opt)
vim.keymap.set("v", "/", ":move '>+1<CR>gv-gv", opt)
vim.keymap.set("v", "J", "5j")
vim.keymap.set("v", "K", "5k")
vim.keymap.set("v", "H", "^")
vim.keymap.set("v", "L", "$")

-- clear search highlights
vim.keymap.set("n", "<C-n>", ":nohlsearch<CR>", opt)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')


-- window management
vim.keymap.set("n", "sh", ":vsp<CR>", opt)
vim.keymap.set("n", "sv", ":sp<CR>", opt)
vim.keymap.set("n", "sx", "<C-w>c", opt)
vim.keymap.set("n", "so", "<C-w>o", opt) -- close others
vim.keymap.set("n", "s;", ":vertical resize -10<CR>", opt)
vim.keymap.set("n", "s'", ":vertical resize +10<CR>", opt)
vim.keymap.set("n", "s[", ":resize -10<CR>", opt)
vim.keymap.set("n", "s/", ":resize +10<CR>", opt)
vim.keymap.set("n", "s=", "<C-w>=", opt)

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

----------------------
-- Keymaps for other plugins
----------------------

-- vim-maximizer
vim.keymap.set("n", "<leader>m", ":MaximizerToggle<CR>")
