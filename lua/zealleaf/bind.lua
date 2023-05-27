---------------------
-- preset
---------------------
vim.cmd("autocmd!")
vim.g.mapleader = ";"
local bind = vim.keymap.set
local opt = {
	noremap = true,
	silent = true,
}

---------------------
-- General
---------------------
bind("n", "s", ":w!<CR>", opt)
bind("n", "ss", ":wa!<CR>", opt)
-- bind("n", "q", ":q!<CR>", opt)
-- bind("n", "qq", ":qa!<CR>", opt)
bind("n", "q", "<C-w>c", opt)
bind("n", "<C-q>", ":qa!<CR>", opt)
-- use <C-Spa> to exit insert mode
bind("n", "J", "", opt)
bind("n", "H", "^")
bind("n", "L", "$")
bind("n", "J", "5j")
bind("n", "K", "5k")
-- 上下移动选中文本
bind("v", "[", ":move '<-2<CR>gv-gv", opt)
bind("v", "/", ":move '>+1<CR>gv-gv", opt)
bind("v", "J", "5j")
bind("v", "K", "5k")
bind("v", "H", "^")
bind("v", "L", "$")

-- clear search highlights
bind("n", "<C-n>", ":nohlsearch<CR>", opt)

-- delete single character without copying into register
bind("n", "x", '"_x')

-- increment/decrement numbers
bind("n", "<leader>a", "<C-a>") -- increment
bind("n", "<leader>x", "<C-x>") -- decrement

-- window management
bind("n", "sh", ":vsp<CR>", opt)
bind("n", "sv", ":sp<CR>", opt)
bind("n", "sx", "<C-w>c", opt)
bind("n", "so", "<C-w>o", opt) -- close others
bind("n", "s;", ":vertical resize -10<CR>", opt)
bind("n", "s'", ":vertical resize +10<CR>", opt)
bind("n", "s[", ":resize -10<CR>", opt)
bind("n", "s/", ":resize +10<CR>", opt)
bind("n", "s=", "<C-w>=", opt)

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

----------------------
-- Plugin
----------------------

-- vim-maximizer
bind("n", "<leader>m", ":MaximizerToggle<CR>")

-- hop
bind("n", "<leader>wi", ":HopPattern<CR>")
bind("n", "<leader>w", ":HopWord<CR>")

-- gitsigns
bind("n", "<leader>gn", "<cmd>Gitsigns next_hunk<CR>")
bind("n", "<leader>gp", "<cmd>Gitsigns prev_hunk<CR>")
bind("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>")
bind("n", "<leader>gd", "<cmd>GitDiff<CR>")
bind("n", "<leader>gdc", "<cmd>GitDiffClose<CR>")
