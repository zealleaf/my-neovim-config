---------------------
-- General Keymaps
---------------------
vim.cmd("autocmd!")
vim.g.mapleader = ";"
local keymap = vim.keymap
local opt = {
	noremap = true,
	silent = true,
}
keymap.set("n", "s", ":w!<CR>", opt)
keymap.set("n", "ss", ":wa!<CR>", opt)
-- keymap.set("n", "q", ":q!<CR>", opt)
-- keymap.set("n", "qq", ":qa!<CR>", opt)
keymap.set("n", "q", "<C-w>c", opt)
keymap.set("n", "<C-q>", ":qa!<CR>", opt)
-- use <C-Spa> to exit insert mode
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
keymap.set("n", "<C-n>", ":nohlsearch<CR>", opt)

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>a", "<C-a>") -- increment
keymap.set("n", "<leader>x", "<C-x>") -- decrement

-- window management
keymap.set("n", "sh", ":vsp<CR>", opt)
keymap.set("n", "sv", ":sp<CR>", opt)
keymap.set("n", "sc", "<C-w>c", opt)
keymap.set("n", "so", "<C-w>o", opt) -- close others
keymap.set("n", "s;", ":vertical resize -10<CR>", opt)
keymap.set("n", "s'", ":vertical resize +10<CR>", opt)
keymap.set("n", "s[", ":resize -10<CR>", opt)
keymap.set("n", "s/", ":resize +10<CR>", opt)
keymap.set("n", "s=", "<C-w>=", opt)

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})
